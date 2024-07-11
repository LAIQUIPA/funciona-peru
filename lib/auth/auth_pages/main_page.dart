import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rive/rive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //variables internet conection
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  //controlaldor rive
  StateMachineController? controller;
  //SMIInput<bool>? isActive;
  bool selectedContainer = false;
  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription =
          Connectivity().onConnectivityChanged.listen((result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      });

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //GATITO
                SizedBox(
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset(
                    "assets/rive/catv1.riv",
                    fit: BoxFit.fitHeight,
                    onInit: (artboard) {
                      controller = StateMachineController.fromArtboard(
                        artboard,

                        /// from rive, you can see it in rive editor
                        "State Machine 1",
                      );
                      if (controller == null) return;

                      artboard.addController(controller!);
                      //isActive = controller?.findSMI('searchHover');
                    },
                  ),
                ),
                //NOMBRE
                Image.asset(
                  "assets/images/logo.png",
                  width: 250,
                  height: 250,
                )
              ],
            ),
            //AQUI EL CENTRO
            SizedBox(
              width: 350,
              height: 400,
              child: ListView(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 40,
                        ),
                        SizedBox(width: 15),
                        Text(
                            'Obten tu\nlicencia de Funcionamiento\ny Certificado ITSE'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.assignment_turned_in,
                          size: 40,
                        ),
                        SizedBox(width: 15),
                        Text(
                            'Ya cuento con mi\nlicencia de funcionamiento\ny certificado ITSE'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedContainer = !selectedContainer;
                        FirebaseAuth.instance.signOut();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceOut,
                      color: selectedContainer ? Colors.amber : Colors.blue,
                      width: selectedContainer? 100 : 50,
                      height: selectedContainer? 100 : 50,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off_sharp),
              SizedBox(width: 5),
              Text('Sin Conexión')
            ],
          ),
          content: const Text(
              'Por favor, revisa tu conexión a internet para continuar.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
