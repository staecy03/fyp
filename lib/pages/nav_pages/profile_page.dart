import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/pages/login&signUp/Services/authentication.dart';
import 'package:mansau_sabah/pages/login&signUp/screen/login_page.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Profile image placeholder
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green[100],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.green[700],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "Hope you have a pleasant trip.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Come again!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Email:",
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              currentUser.email ?? "No email",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade300,
              ),
            ),

            const SizedBox(height: 40),

            MyButton2(
              onTab: () async {
                await AuthServices().signOut(
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                );
              },
              text: "Log Out",
            ),
          ],
        ),
      ),
    );
  }
}

/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/pages/login&signUp/Services/authentication.dart';
import 'package:mansau_sabah/pages/login&signUp/screen/login_page.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/button.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //edit field
  Future<void> editField(String field)async {}

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hope you have a pleasant trip.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Come again!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            MyButton2(
                onTab: () async {
                  await AuthServices()
                      .signOut(Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ));
                },
                text: "Log Out"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
          ],
        ),
      ),
    );
  }
}*/
