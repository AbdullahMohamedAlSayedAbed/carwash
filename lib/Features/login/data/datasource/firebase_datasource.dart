import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in with email and password: $e');
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // عشان لو العميل خرج قبل مايكمل التسجيل
      // عشان كمان نحفظ فى الفاير أوث ونربطها بالعميل
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('tempUsername', username);
      await prefs.setString('uid', userCredential.user!.uid);
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<void> addCarType(String carType) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String? username = prefs.getString('tempUsername');
      if (uid != null && username != null) {
        await _firestore
            .collection('user')
            .doc(uid)
            .set({'username': username, 'carType': carType, 'uid': uid});

        await prefs.remove('tempUsername');
        await prefs.remove('uid');
      } else {
        throw Exception('No user ID found in SharedPreferences');
      }
    } catch (e) {
      throw Exception('Failed to add car type: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCars() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('cars').get();
      List<Map<String, dynamic>> cars = snapshot.docs.map((doc) {
        return {
          'name': doc['name'],
          'image': doc['image'],
        };
      }).toList();
      return cars;
    } catch (e) {
      throw Exception('Failed to get cars: $e');
    }
  }

  Future<bool> checkIfCarTypeExists(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('user').doc(uid).get();
      if (userDoc.exists && userDoc['carType'] != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error checking car type: $e');
    }
  }

  Future<User?> loginWithGmail() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        User? currentUser = userCredential.user;

        if (currentUser != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('uid', currentUser.uid);
          await prefs.setString(
              'tempUsername', currentUser.displayName ?? "Unknown");

          return currentUser;
        }
      }
      return null;
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  Future<User?> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken? accessToken = loginResult.accessToken;

        if (accessToken != null) {
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken.tokenString);

          UserCredential userCredential =
              await _firebaseAuth.signInWithCredential(facebookAuthCredential);
          User? currentUser = userCredential.user;

          if (currentUser != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('uid', currentUser.uid);
            await prefs.setString(
                'tempUsername', currentUser.displayName ?? "Unknown");

            return currentUser;
          }
        }
      }
      return null;
    } catch (e) {
      throw Exception('Failed to sign in with Facebook: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
