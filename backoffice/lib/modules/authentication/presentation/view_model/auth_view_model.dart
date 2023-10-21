import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthViewModel {
  void authStateChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('authStateChanges - User is signed in!: ${user.email}');
      }
    });
  }

  void idTokenChanges() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('idTokenChanges - User is signed in!: ${user.email}');
      }
    });
  }

  void userchanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print(' userchanges - User is signed in!: ${user.email}');
      }
    });
  }

  configureAuthState() {
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }
}
