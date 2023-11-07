import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel {
  void authStateChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('authStateChanges - User is signed in!: ${user.email}');
      }
    });
  }

  void idTokenChanges() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('idTokenChanges - User is signed in!: ${user.email}');
      }
    });
  }

  void userchanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint(' userchanges - User is signed in!: ${user.email}');
      }
    });
  }

  configureAuthState() {
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }
}
