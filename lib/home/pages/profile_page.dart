import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/admin_panel/menu_admin.dart';
import 'package:funciona_peru/home/pages/admin_panel/service/database.dart';
import 'package:funciona_peru/theme/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final email = FirebaseAuth.instance.currentUser!.email!;
  Stream? stream;
  getontheload() async {
    stream = await DatabaseMethods().getProfileData(email);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String email = FirebaseAuth.instance.currentUser!.email!;
    TextTheme texttheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Mis Datos', style: texttheme.titleLarge),
                //card
                Center(
                  child: SizedBox(
                    width: 280,
                    child: Card(
                      elevation: 5,
                      color: mainColor600,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              maxRadius: 40,
                              foregroundImage: AssetImage(
                                'assets/logo.jpeg',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 5,
                              height: 50,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),

                            //DATOS DEL PERFIL
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Email:'),
                                  Text(
                                    email,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //AGREGAR DATOS DEL FORMULARIO

                StreamBuilder(
                    stream: stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        DocumentSnapshot map = snapshot.data;
                        dynamic data1 = map.data();
                        print('dasdsa$data1');
                        print(snapshot.hasData);
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          width: size.width,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: mainColor600, width: 3),
                              borderRadius: BorderRadius.circular(15)),
                          child: snapshot.hasData
                              ? data1 != null
                                  ? data1.containsKey('ruc')
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.settings, size: 30),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    'RUC: ${snapshot.data['ruc']}',
                                                    style: texttheme.bodyLarge),
                                              ],
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    'Razon Social: ${snapshot.data['razon social']}',
                                                    style: texttheme.bodyLarge),
                                              ],
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    'Dirección: ${snapshot.data['direccion']}',
                                                    style: texttheme.bodyLarge),
                                              ],
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    'Distrito: ${snapshot.data['distrito']}',
                                                    style: texttheme.bodyLarge),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const Center(
                                          child:
                                              Text('Completa Comienza Tramite'),
                                        )
                                  : const Center(
                                      child: Text('Completa Comienza Tramite'),
                                    )
                              : const Center(
                                  child: Text('Completa Comienza Tramite'),
                                ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                const SizedBox(height: 10),
                //otros
                ElevatedButton(
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: const Text('Cerrar Sesión')),

                const SizedBox(height: 50),
                //MENU ADMMIN
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MenuAdminPage(),
                    ));
                  },
                  child: const Text('MENU ADMIN'),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
