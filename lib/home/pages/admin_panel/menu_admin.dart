import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/admin_panel/add_aprendedata.dart';
import 'package:funciona_peru/home/pages/admin_panel/add_quizz.dart';
import 'package:funciona_peru/home/pages/admin_panel/service/database.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_components/aprende_boxclass.dart';
import 'package:funciona_peru/theme/app_colors.dart';

class MenuAdminPage extends StatelessWidget {
  const MenuAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Menú Admin',
                style: theme.titleLarge,
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 20),
              //ADMIN PANEL
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white70)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Quizz Menu',
                        style: theme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddQuizz(),
                            ));
                          },
                          child: const Text('AÑADIR PREGUNTA'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //LICENCIA QUIZZ
                    Center(
                      child: Text(
                        'Quizz Licencia',
                        style: theme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const QuizzDataList(
                      category: 'Licencia',
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    //ITSE QUIZZ
                    Center(
                      child: Text(
                        'Quizz ITSE',
                        style: theme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const QuizzDataList(
                      category: 'ITSE',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //ADMIN PANEL
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white70)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TITULO
                    Center(
                      child: Text(
                        'Aprende Menu',
                        style: theme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddAprendeData(),
                        ));
                      },
                      child: const Text('AÑADIR TITULOS'),
                    ),
                    const SizedBox(height: 20),
                    //LICENCIA
                    Text(
                      'Aprende Datos Licencia',
                      style: theme.titleSmall,
                    ),
                    const ShowListAprende(
                      category: 'Licencia',
                    ),
                    const SizedBox(height: 10),
                    //ITSE
                    Text(
                      'Aprende Datos ITSE',
                      style: theme.titleSmall,
                    ),
                    const ShowListAprende(
                      category: 'ITSE',
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class QuizzDataList extends StatefulWidget {
  const QuizzDataList({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<QuizzDataList> createState() => _QuizzDataListState();
}

class _QuizzDataListState extends State<QuizzDataList> {
  TextEditingController controlleropcion = TextEditingController();
  Stream? quizzStream;
  List preguntaswey = [
    ['opcion1', false],
    ['opcion2', false],
    ['opcion3', false],
    ['opcion4', false],
    ['correcta', false],
  ];

  getontheLoad() async {
    quizzStream = await DatabaseMethods().getCateriasQuizz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getontheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: quizzStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  List preguntas = [
                    ['opcion1', false],
                    ['opcion2', false],
                    ['opcion3', false],
                    ['opcion4', false],
                  ];
                  for (var i = 0; i < 4; i++) {
                    if (ds[preguntas[i][0]] == ds['correcta']) {
                      preguntas[i][1] = true;
                    }
                  }

                  return ExpansionTile(
                    title: Text(
                      ds['pregunta'],
                    ),
                    children: preguntas
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: size.width * 0.6,
                                      child: Text(
                                        ds[e[0]],
                                        style: theme.bodyLarge,
                                      )),
                                  GestureDetector(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              'Cambiar Pregunta ${e[0]}',
                                              style: theme.titleSmall,
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        scaffoldBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: TextField(
                                                    controller:
                                                        controlleropcion,
                                                    decoration: InputDecoration(
                                                        hintStyle:
                                                            theme.bodyLarge,
                                                        hintText: ds[e[0]],
                                                        border:
                                                            InputBorder.none),
                                                  ),
                                                )
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    controlleropcion.clear();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Text('Cancelar'),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            await DatabaseMethods()
                                                                .updatePreguntaCategoria({
                                                              '${e[0]}':
                                                                  controlleropcion
                                                                      .text
                                                            }, widget.category,
                                                                    ds.id);
                                                            controlleropcion
                                                                .clear();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text('Ok'))
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        size: 35,
                                      )),
                                  const SizedBox(width: 20),
                                  //check
                                  GestureDetector(
                                    onTap: () async {
                                      DatabaseMethods().updatePreguntaCategoria(
                                          {'correcta': ds[e[0]]},
                                          widget.category,
                                          ds.id);

                                      setState(() {});
                                    },
                                    child: e[1]
                                        ? const Icon(
                                            Icons.check_box,
                                            size: 35,
                                          )
                                        : const Icon(
                                            Icons
                                                .check_box_outline_blank_outlined,
                                            size: 35,
                                          ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                },
              )
            : const Text('Sin datos');
      },
    );
  }
}

class ShowListAprende extends StatefulWidget {
  const ShowListAprende({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<ShowListAprende> createState() => _ShowListAprendeState();
}

class _ShowListAprendeState extends State<ShowListAprende> {
  Stream? aprendeStream;
  List selectedItems = [];

  getontheLoad() async {
    aprendeStream = await AprendeClass().getAprendedata(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return StreamBuilder(
      stream: aprendeStream,
      builder: (context, snapshot) {
        //List snap = snapshot.data.docs;
        return snapshot.hasData
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length, //snap.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //leading: const Icon(Icons.circle),
                        backgroundColor:
                            selectedItems.contains(ds['titulo'].toString())
                                ? mainColor600
                                : Colors.transparent,
                        title: Text(ds['titulo']),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                    onTap: () => showDialog(
                                        context: context,
                                        builder: (context) {
                                          TextEditingController urlController =
                                              TextEditingController();
                                          TextEditingController titController =
                                              TextEditingController();
                                          TextEditingController descController =
                                              TextEditingController();
                                          return AlertDialog(
                                            clipBehavior: Clip.none,
                                            title: const Text('Agregar Item'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListaTxtfield(
                                                  controller: urlController,
                                                  theme: theme,
                                                  labelText:
                                                      'URL de una Imagen',
                                                ),
                                                ListaTxtfield(
                                                  controller: titController,
                                                  theme: theme,
                                                  labelText: 'Titulo',
                                                ),
                                                ListaTxtfield(
                                                  controller: descController,
                                                  theme: theme,
                                                  labelText: 'Descripción',
                                                ),
                                                //BUTTON
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      await AprendeClass()
                                                          .addAprendeBoxItem([
                                                        {
                                                          'imgUrl':
                                                              urlController
                                                                  .text,
                                                          'titulo':
                                                              titController
                                                                  .text,
                                                          'descripcion':
                                                              descController
                                                                  .text
                                                        },
                                                      ], widget.category,
                                                              ds.id.toString());
                                                    },
                                                    child:
                                                        const Text('Agregar'))
                                              ],
                                            ),
                                          );
                                        }),
                                    child:
                                        const Icon(Icons.add_circle_rounded)),
                                const Icon(Icons.edit),
                                const Icon(Icons.delete),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              )
            : Container();
      },
    );
  }
}

class ListaTxtfield extends StatelessWidget {
  const ListaTxtfield({
    super.key,
    required this.controller,
    required this.theme,
    required this.labelText,
  });

  final TextEditingController controller;
  final TextTheme theme;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: scaffoldBackgroundColor,
      ),
      child: TextField(
        controller: controller,
        style: theme.bodyLarge,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
