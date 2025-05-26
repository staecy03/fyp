/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mansau_sabah/models/plan.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add or update plan in Firestore
  Future<void> addPlan(Plan plan) async {
    try {
      await _db.collection('plans').doc(plan.id.toString()).set(plan.toJson());
    } catch (e) {
      print("Error adding plan to Firestore: $e");
    }
  }

  // Fetch all plans from Firestore
  Stream<List<Plan>> getPlans() {
    return _db
        .collection('plans')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Plan.fromJson(doc.data()))
            .toList());
  }

  // Delete plan from Firestore
  Future<void> deletePlan(String planId) async {
    try {
      await _db.collection('plans').doc(planId).delete();
    } catch (e) {
      print("Error deleting plan from Firestore: $e");
    }
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/plan.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addPlan(Plan plan) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('plans')
        .doc(plan.id.toString())
        .set(plan.toJson());
  }

  Future<void> deletePlan(String planId) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('plans')
        .doc(planId)
        .delete();
  }

  Stream<List<Plan>> getPlans() {
    return _db
        .collection('users')
        .doc(userId)
        .collection('plans')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Plan.fromJson(doc.data()))
            .toList());
  }
}*/
