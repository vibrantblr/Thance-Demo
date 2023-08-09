import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up a user with email and password
  Future<void> signUpWithEmailPassword(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Get the current authenticated user
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  // Save the user's name to Firestore
  Future<void> saveName(String userId, String name) async {
    await _firestore.collection('users').doc(userId).set({'name': name});
  }

  // Sign out the user
  Future<void> signOut() async {
    await _auth.signOut();
  }

// Inside UserRepository class
  Future<String> getUserName(String userId) async {
    final DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(userId).get();
    if (snapshot.exists) {
      final name =
          snapshot.get('name') as String; // Use the correct field name here
      return name;
    } else {
      return 'Unknown';
    }
  }

  Future<bool> isNameRegistered() async {
    try {
      final currentUser = getCurrentUser();
      // ignore: unnecessary_null_comparison
      if (currentUser != null) {
        final userName = await getUserName(currentUser.toString());
        return userName.isNotEmpty;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
