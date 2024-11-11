import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register a new user
  Future<bool> registerUser({
    required String email,
    required String password,
    required String nama,
    required String nik,
    required String noKk,
    required String nomorTelepon,
  }) async {
    try {
      // Create a new user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user information in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'nama': nama,
        'nik': nik,
        'noKk': noKk,
        'nomorTelepon': nomorTelepon,
        'email': email,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth-specific errors
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      return false;
    }
  }

  // Login user with email and password
  Future<bool> loginUser(String email, String password) async {
    try {
      // Sign in the user with email and password
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
      return false;
    }
  }

  // Sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get the currently logged-in user
  User? get currentUser => _auth.currentUser;
}
