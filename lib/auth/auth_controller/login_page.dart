import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:funciona_peru/auth/auth_controller/animated_btn.dart';
import 'package:funciona_peru/auth/auth_controller/custom_sign_in_dialog.dart';
import 'package:funciona_peru/theme/imagenes.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationColtroller;
  StateMachineController? controllerGirl;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0XFFb42224),
      body: Stack(
        children: [
          //LOGO FUNCIONA PERU

          /*Container(
            width: size.width,
            height: size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    //Colors.deepPurple.withOpacity(0.8),
                    Color.fromRGBO(37, 63, 137, 0.8),
                    Color.fromRGBO(176, 57, 173, 0.6),
                    Color.fromRGBO(147, 228, 197, 0.2),
                    //Color.fromRGBO(147, 228, 197, 1),
                    Theme.of(context).colorScheme.background.withOpacity(0.4),
                    //Colors.deepPurple.withOpacity(0.8),
                    //Colors.deepPurple.withOpacity(0),
                  ]),
            ),
          ),*/
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          /*Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),*/
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv",
              fit: BoxFit.fitWidth),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          Positioned(
            top: 50,
            child: Image.asset(
              wLogo,
              height: 400,
            ),
          ),

          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    AnimatedBtn(
                      btnAnimationColtroller: _btnAnimationColtroller,
                      press: () {
                        _btnAnimationColtroller.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isSignInDialogShown = true;
                            });

                            customSigninDialog(
                              context,
                              onCLosed: (_) {
                                setState(() {
                                  isSignInDialogShown = false;
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Desarrollado por:\nLuis Angel Aiquipa Ramirez",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
