import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funciona_peru/auth/auth_controller/g_authservice.dart';
import 'package:funciona_peru/theme/app_colors.dart';

import 'sign_in_form.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onCLosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        width: 350,
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          //color: Colors.white.withOpacity(0.94),
          border: Border.all(color: Colors.grey),
          color: scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Disfruta de la experiencia en nuestra app.\nTenemos nuevos servicios para ti.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SignInForm(),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "o",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Ingresa con Email, Apple o Google",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/email_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/apple_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await AuthService().signInWithGoogle();
                          if (context.mounted) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/google_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -48,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).then(onCLosed);
}
