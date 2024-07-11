import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signInFirebase(
  BuildContext context,
  TextEditingController emailTextController,
  TextEditingController passwordTextController,
) async {
  //mostrar loading circle
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  //try catch login
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    //if (context.mounted) Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    //Navigator.pop(context);

    //pop loading circle
  } on FirebaseAuthException catch (e) {
    //pop loading circle
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    displayMessage(context, e.code);
  }
}

//display el error message
void displayMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}
