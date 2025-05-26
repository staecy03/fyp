import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/pages/login&signUp/Services/authentication.dart';
import 'package:mansau_sabah/pages/login&signUp/forgotPassword/forgot_password.dart';
import 'package:mansau_sabah/pages/login&signUp/screen/sign_up.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/button.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/snack_bar.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/textField.dart';
import 'package:mansau_sabah/pages/nav_pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginPage> {
  // for controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    // if login is success, user has been created and navigate to the next screen
    // otherwise show error message
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height / 2.7,
                  child: Image.asset("assets/Mansau_Sabah_logo.png"),
                ),
                TextFieldInput(
                  textEditingController: emailController,
                  hintText: 'Enter your email',
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: 'Enter your password',
                  isPass: true,
                  icon: Icons.lock,
                ),
                // forgot password
                ForgotPassword(),
                MyButton2(onTab: loginUser, text: "Log In"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Don't have an account?",
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " Sign Up",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
