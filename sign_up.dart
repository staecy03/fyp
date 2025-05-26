import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/pages/login&signUp/Services/authentication.dart';
import 'package:mansau_sabah/pages/login&signUp/screen/login_page.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/button.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/snack_bar.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/textField.dart';
import 'package:mansau_sabah/pages/nav_pages/main_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      //navigate to next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      //show the error message
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("assets/Mansau_Sabah_logo.png"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: nameController,
                hintText: 'Enter your name',
                icon: Icons.person,
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: emailController,
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: passwordController,
                hintText: 'Enter your password',
                isPass: true,
                icon: Icons.lock,
              ),
              MyButton2(onTab: signUpUser, text: "Sign Up"),
              SizedBox(
                height: height / 15,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ])),
            ],
          ),
        ),
      )),
    );
  }
}
