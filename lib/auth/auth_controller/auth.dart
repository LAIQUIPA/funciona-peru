import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/auth/auth_controller/login_or_register.dart';
import 'package:funciona_peru/home/bar_controller.dart';
import 'package:funciona_peru/splash_screen/splash_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BarController();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
