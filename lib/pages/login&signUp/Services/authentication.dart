import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for signUp
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        //for register user in firebase auth with email and password
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //for adding user to cloud firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          'name': name,
          "email": email,
          'uid': credential.user!.uid,
        });
        res = "success";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  //For login page
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // login user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the field";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  //for logout
  Future<void> signOut(Future pushReplacement) async {
    await _auth.signOut();
  }
}
