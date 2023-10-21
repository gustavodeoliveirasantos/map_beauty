import 'package:backoffice/modules/authentication/presentation/view_model/auth_view_model.dart';
import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final vm = AuthViewModel();

    vm.authStateChanges();
    vm.configureAuthState();
    vm.userchanges();
    vm.idTokenChanges();
  }

  final providers = [EmailAuthProvider()];
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      showAuthActionSwitch: false, //Remove a possibilidade de add novo user
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }),
      ],
    );
  }
}
