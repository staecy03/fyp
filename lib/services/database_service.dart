import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mansau_sabah/models/plan.dart';

class DatabaseService {
  // Add Plan
  Future<DocumentReference> addPlan(String title, String description) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not logged in");

    final planCollection = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans');

    return await planCollection.add({
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Update Plan
  Future<void> updatePlan(String id, String title, String description) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not logged in");

    final planDoc = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans')
        .doc(id);

    return await planDoc.update({
      'title': title,
      'description': description,
    });
  }

  // Update Plan Status
  Future<void> updatePlanStatus(String id, bool completed) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not logged in");

    final planDoc = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans')
        .doc(id);

    return await planDoc.update({'completed': completed});
  }

  // Delete Plan
  Future<void> deletePlan(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not logged in");

    final planDoc = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans')
        .doc(id);

    return await planDoc.delete();
  }

  // Get Pending Plans
  Stream<List<Plan>> get plans {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Stream.empty();
    }

    final planCollection = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans');

    return planCollection
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  // Get Completed Plans
  Stream<List<Plan>> get completedplans {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Stream.empty();
    }

    final planCollection = FirebaseFirestore.instance
        .collection('itineraries')
        .doc(user.uid)
        .collection('plans');

    return planCollection
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  // Convert Firestore snapshot to List<Plan>
  List<Plan> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Plan(
        id: doc.id,
        title: doc['title'] ?? '',
        description: doc['description'] ?? '',
        completed: doc['completed'] ?? false,
        timestamp: doc['createdAt'] ?? '',
      );
    }).toList();
  }
}
/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mansau_sabah/models/plan.dart';
//import 'package:mansau_sabah/models/plan.dart';

class DatabaseService {
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection("plans");

  User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentReference> addPlan(String title, String description) async {
    return await planCollection.add({
      'uid': user!.uid,
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updatePlan(String id, String title, String description) async {
    final updateplanCollection =
        FirebaseFirestore.instance.collection("plans").doc(id);
    return await updateplanCollection.update({
      'title': title,
      'description': description,
    });
  }

  Future<void> updatePlanStatus(String id, bool completed) async {
    return await planCollection.doc(id).update({'completed': completed});
  }

  //delete plan

  Future<void> deletePlan(String id) async {
    return await planCollection.doc(id).delete();
  }

  //get pending plan
  Stream<List<Plan>> get plans {
    return planCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  //get completed plan
  Stream<List<Plan>> get completedplans {
    return planCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  List<Plan> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Plan(
          id: doc.id,
          title: doc['title'] ?? '',
          description: doc['description'] ?? '',
          completed: doc['completed'] ?? false,
          timestamp: doc['createdAt'] ?? '');
    }).toList();
  }
}*/
