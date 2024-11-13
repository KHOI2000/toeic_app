import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get user => _auth.currentUser;

  String _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'invalid-credential':
        return 'The supplied auth credential is incorrect, malformed or has expired.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'too-many-requests':
        return ' We have blocked all request all requests from this device due to unusual activity. Try again later.';
      default:
        return 'An undefined error occurred.';
    }
  }
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
      EmailAuthProvider.credential(email: email, password: password);
      // if user is anonymous, link it
      // if not, sign in normally
      // TODO: handle case not verify email?
      // TODO: make this to a common function
      if (user != null && user!.isAnonymous) {
        debugPrint('current anonymous user is ${user!.uid}');
        UserCredential? userData = await linkCredential(credential);
        if (userData == null) {
          debugPrint(
              'this case is wrongly link credential, need to signIn directly');
          UserCredential userCredential =
          await _auth.signInWithCredential(credential);
          if (userCredential.user != null &&
              userCredential.user!.emailVerified) {
            debugPrint(
                'user ${userCredential.user!.uid} signIn normally because wrongly link credential');
          }
        }
      } else {
        debugPrint('this case is signIn directly');
        UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        if (userCredential.user != null && userCredential.user!.emailVerified) {
          debugPrint('user ${userCredential.user!.uid} signIn directly');
        }
      }
    } on FirebaseAuthException catch (e) {
      final errorMessage = _handleFirebaseAuthException(e);
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: errorMessage,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      if (user != null && user!.isAnonymous) {
        debugPrint('current anonymous user is ${user!.uid}');
        UserCredential? userData = await linkCredential(credential);
        if (userData == null) {
          debugPrint(
              'this case is wrongly link credential, need to signIn directly');
          UserCredential userCredential =
          await _auth.signInWithCredential(credential);
          if (userCredential.user != null &&
              userCredential.user!.emailVerified) {
            debugPrint(
                'user ${userCredential.user!.uid} signIn normally because wrongly link credential');
          }
        }
      } else {
        debugPrint('this case is signIn directly');
        UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        if (userCredential.user != null && userCredential.user!.emailVerified) {
          debugPrint('user ${userCredential.user!.uid} signIn directly');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }

  Future<UserCredential?> linkCredential(AuthCredential credential) async {
    try {
      final UserCredential? userCredential =
      await _auth.currentUser?.linkWithCredential(credential);
      if (userCredential != null) {
        return userCredential;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          debugPrint("The provider has already been linked to the user");
          break;
        case "invalid-credential":
          debugPrint("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          debugPrint(
              "The account corresponding to the credential already exists, "
                  "or is already linked to a Firebase User.");
          break;
        default:
          debugPrint("Unknown error: ${e.message ?? 'default'}");
      }
    }
    return null;
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String?> getIdToken() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return await user.getIdToken();
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error fetching ID token: $e');
    }
  }
}
