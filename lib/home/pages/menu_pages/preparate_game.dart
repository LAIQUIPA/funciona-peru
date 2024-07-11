// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/admin_panel/service/database.dart';

import 'package:funciona_peru/theme/app_colors.dart';

class PreparateGame extends StatefulWidget {
  final String category;
  const PreparateGame({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<PreparateGame> createState() => _PreparateGameState();
}

class _PreparateGameState extends State<PreparateGame> {
  bool show = false;
  int pageIndex = 1;
  int? numPreguntas;
  int numOpciones = 4;
  int pregAcertadas = 0;
  bool acertada = false;
  int? selectedOption;

  //TIEMPOS
  int cronometro = 0;
  int segundos = 0;
  late Timer time1;
  String tiempoTexto = "00:00";

  void _startCronometro() {
    time1 = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (context.mounted) {
          setState(() {
            cronometro++;
            segundos++;

            if (segundos == 60) {
              segundos = 0;
            }

            tiempoTexto =
                "${Duration(seconds: cronometro).inMinutes.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}";
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  getontheLoad() async {
    quizzStream = await DatabaseMethods().getCateriasQuizz(widget.category);
    setState(() {});
  }

  @override
  void dispose() {
    time1.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _startCronometro();
    getontheLoad();
    super.initState();
  }

  Stream? quizzStream;
  PageController pageController = PageController();

  mostrarResultados() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title:
            Text('Resultados:', style: Theme.of(context).textTheme.titleSmall),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tiempo: $tiempoTexto',
                style: Theme.of(context).textTheme.titleSmall),
            Text('Total Preguntas: $numPreguntas',
                style: Theme.of(context).textTheme.bodyLarge),
            Text(
              'Acertadas: $pregAcertadas',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text('Fallidas: ${numPreguntas! - pregAcertadas}',
                style: Theme.of(context).textTheme.bodyLarge),
            Text(
                'Porcentaje: ${((pregAcertadas / numPreguntas!) * 100).toInt()}% correctas',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () async {
                //sube elr esultado a firebase
                final email = FirebaseAuth.instance.currentUser!.email;
                await DatabaseMethods().addGameResultado({
                  'categoria': widget.category,
                  'tiempo': tiempoTexto.toString(),
                  'preguntas': numPreguntas.toString(),
                  'acertadas': pregAcertadas.toString(),
                  'fallidas': '${numPreguntas! - pregAcertadas}',
                  'porcentaje':
                      '${((pregAcertadas / numPreguntas!) * 100).toInt()}% correctas',
                }, email.toString());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Cerrar'))
        ],
      ),
    );
  }

  Widget allQuizz() {
    //auth
    return StreamBuilder(
      stream: quizzStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 20),
                  //linear progress idnicator
                  LinearProgressIndicator(
                    minHeight: 15,
                    borderRadius: BorderRadius.circular(20),
                    value: pageIndex / snapshot.data.docs.length,
                  ),
                  Text("$pageIndex/${snapshot.data.docs.length}"),

                  //quiz builder
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: ds['image'],
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: mainColor600,
                                  ),
                                ), /*Image.network(
                                  ds['image'],
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),*/
                              ),
                              //PREGUNTA
                              const SizedBox(height: 20),
                              Text(
                                ds["pregunta"],
                                style: Theme.of(context).textTheme.titleSmall,
                              ),

                              //OPCION 1
                              const SizedBox(height: 20),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: numOpciones,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedOption = index;

                                            if (ds["correcta"] ==
                                                ds["opcion${index + 1}"]) {
                                              acertada = true;
                                            } else {
                                              acertada = false;
                                            }
                                            setState(() {});
                                          },
                                          child: show
                                              ? Container(
                                                  width: 300,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: ds["correcta"] ==
                                                                  ds[
                                                                      "opcion${index + 1}"]
                                                              ? Colors
                                                                  .greenAccent
                                                              : mainColor600,
                                                          width:
                                                              selectedOption ==
                                                                      index
                                                                  ? 5.5
                                                                  : 1.5)),
                                                  child: Text(
                                                    ds['opcion${index + 1}'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                )
                                              : Container(
                                                  width: 300,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: greyColor,
                                                          width:
                                                              selectedOption ==
                                                                      index
                                                                  ? 5.5
                                                                  : 1.5)),
                                                  child: Text(
                                                    ds['opcion${index + 1}'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                        ),
                                      );
                                    }),
                              ),

                              /*GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ds["correcta"] ==
                                                        ds["opcion1"]
                                                    ? Colors.greenAccent
                                                    : mainColor600,
                                                width: 1.5)),
                                        child: Text(
                                          ds['opcion1'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      )
                                    : Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: greyColor, width: 1.5)),
                                        child: Text(
                                          ds['opcion1'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                              ),
                              //OPCION 2
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ds["correcta"] ==
                                                        ds["opcion2"]
                                                    ? Colors.greenAccent
                                                    : mainColor600,
                                                width: 1.5)),
                                        child: Text(
                                          ds['opcion2'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      )
                                    : Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: greyColor, width: 1.5)),
                                        child: Text(
                                          ds['opcion2'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 20),*/
                              //SIGUIENTE HOJA BUTTON

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //progress indicator

                                    //button
                                    Text(
                                      'Continuar',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(width: 15),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (acertada == true) {
                                              pregAcertadas++;
                                            }
                                            setState(() {
                                              show = true;
                                            });
                                            await Future.delayed(
                                                const Duration(
                                                    milliseconds: 400),
                                                () => setState(() {
                                                      show = false;
                                                      selectedOption = null;
                                                      if (snapshot.data.docs
                                                              .length ==
                                                          index + 1) {
                                                        numPreguntas = snapshot
                                                            .data.docs.length;
                                                        pageIndex = snapshot
                                                            .data.docs.length;
                                                        time1.cancel();

                                                        mostrarResultados();
                                                      } else {
                                                        pageIndex = index + 2;
                                                        numPreguntas = snapshot
                                                            .data
                                                            .docs
                                                            .length; //OBTENER NUM DE PREGUNTAS
                                                      }
                                                    }));
                                            print(numPreguntas);

                                            pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.easeIn);
                                          },
                                          child: const Icon(
                                              Icons.arrow_forward_ios_rounded)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(child: Text('No hay datos'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprende'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: mainColor600, borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Cronometro : $tiempoTexto',
                style: Theme.of(context).textTheme.titleSmall,
              )),
          const SizedBox(height: 5),
          Expanded(child: allQuizz()),
        ],
      ),
    );
  }
}
