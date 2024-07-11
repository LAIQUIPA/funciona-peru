import 'package:flutter/material.dart';

import 'package:funciona_peru/auth/auth_controller/register_page.dart';
import 'package:funciona_peru/auth/onboard/onbording_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //Inicia mostrando el login page
  bool showLoginpage = true;

  //toogle between login and register page
  void tooglePages() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return OnBordingScreen(onTap: tooglePages);
    } else {
      return RegisterPage(onTap: tooglePages);
    }
  }
}
