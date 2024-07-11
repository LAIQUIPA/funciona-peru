import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/menu_pages/comienza_components/Anexo4_preguntas_class.dart';
import 'package:funciona_peru/home/pages/menu_pages/comienza_components/comienza_components.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:http/http.dart' as http;

class ComienzaGame extends StatefulWidget {
  final String category;
  const ComienzaGame({super.key, required this.category});

  @override
  State<ComienzaGame> createState() => _ComienzaGameState();
}

class _ComienzaGameState extends State<ComienzaGame> {
  String? documentUrl;
  final pageController = PageController(initialPage: 0, keepPage: true);
  

  Future<String> generateDocument(
      String? apiKey, String? documentId, String? format, dynamic data) async {
    final requestData = {
      'apiKey': apiKey,
      'document': documentId ?? 'sample',
      'data': data ?? {},
      'format': format ?? '',
    };

    const String url = 'https://app.documentero.com/api';
    final headers = {'Content-type': 'application/json'};

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final documentUrl = jsonResponse['data'];
      //print(documentUrl);
      return documentUrl;
    } else {
      print('Fallo con el estado:${response.statusCode}.');
      print('Mensaje de Error:${response.body}.');
      throw Exception('Fallo al general el documento - ${response.body}');
    }
  }

  nextPagePass() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }

  nextEspecificPagePass(int page) {
    if (pageController.hasClients) {
      pageController.jumpToPage(page);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Comienza'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //COMPLETAR FORMULARIOS
          Expanded(
            child: PageView(
              pageSnapping: false,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //index 0
                TramitePJoPN(
                  pageController: pageController,
                ),
                //index 1
                TramiteDatosSolicitante(
                  onTap: nextPagePass,
                ),
                //index 2
                TramiteDatosEstablecimiento(
                  onTap: nextPagePass,
                ),
                const TramiteAnexo4Form(),
              ],
            ),
          ),

          //GENERAR DOCUMENTO BUTTON
          /*ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
      
                documentUrl = await generateDocument(
                    '4RE32MY-O3GE45Y-VW67GSA-BYYZMZQ',
                    'bQHQV76sT6ePzXHqkude',
                    'pdf', {
                  "name": "ASD",
                  "dni": "dnASDDi",
                  "domicilio": "domicFWEFilio",
                  "correo": "corSDFreo",
                  "teléfono": "telFDSFéfono",
                  "razón_social": "razóFSDFn_social",
                  "RUC": "RUFSFDC"
                });
                //print(documentUrl);
                if (!context.mounted) return;
                Navigator.pop(context);
      
                await launchUrl(
                  Uri.parse(documentUrl.toString()),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Text('Documentero')),*/
        ],
      ),
    );
  }
}

class TramiteAnexo4Form extends StatelessWidget {
  const TramiteAnexo4Form({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: color800, borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Anexo 4 - Declaracion Jurada de Cumplimiento de las Condiciones de Seguridad',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 15),
              Text(
                'Completa las siguientes preguntas:\n\nSeleccionando si su establecimiento CUMPLE o NO CORRESPONDE al rubro de su negocio.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 15),
            ],
          ),
          //LA EDIFICACION
          FormulariosPageView(pageController: pageController),
        ],
      ),
    );
  }
}

class FormulariosPageView extends StatelessWidget {
  const FormulariosPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final List<TitulosAnexo4> titulos = [
      TitulosAnexo4(
          descripcion:
              'I .- Declaro que mi Establecimiento Objeto de Inspección se encuentra implementado para el tipo de actividad a desarrollar cumpliendo con las siguientes condiciones básicas.',
          PreguntasAnexo4.preguntasForm1),
      TitulosAnexo4(
          descripcion:
              'II.- Declaro que mi Establecimiento Objeto de Inspección cumple con las condiciones de seguridad señaladas a continuación, las mismas que me comprometo a mantenerlas obligatoriamente.\n\nCon respecto al:\nRIESGO DE INCENDIO',
          PreguntasAnexo4.preguntasForm2),
      TitulosAnexo4(
          descripcion:
              'III.- Declaro que mi Establecimiento Objeto de Inspección cumple con las condiciones de seguridad señaladas a continuación, las mismas que me comprometo a mantenerlas obligatoriamente.\n\nCon respecto al:\nRIESGO DE COLAPSO',
          PreguntasAnexo4.preguntasForm3),
      TitulosAnexo4(
          descripcion:
              'IV.- Declaro que mi Establecimiento Objeto de Inspección cumple con las condiciones de seguridad señaladas a continuación, las mismas que me comprometo a mantenerlas obligatoriamente.\n\nCon respecto al:\nOTROS RIESGOS VINCULADOS A LA ACTIVIDAD',
          PreguntasAnexo4.preguntasForm4),
    ];

    return Expanded(
      child: PageView.builder(
        itemCount: titulos.length,
        controller: pageController,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Formulario',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 10),
                        Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                                color: mainColor600, shape: BoxShape.circle),
                            child: Center(
                                child: Text(
                              '${index + 1}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(thickness: 2),
                    Text(
                      titulos[index].descripcion,
                      style: Theme.of(context).textTheme.titleSmall,
                      softWrap: true,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Anexo4CheckDialog(
                          preguntasLista: titulos[index].preguntasAnexo4,
                        ),
                      );
                    },
                    child: Text(
                      'Click aqui para completar',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 40),
                ContinuarButton(
                  onTap: () {
                    if (index + 1 == titulos.length) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DownloadPage(),
                          ));
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Anexo4CheckDialog extends StatefulWidget {
  const Anexo4CheckDialog({
    super.key,
    required this.preguntasLista,
  });
  final List<PreguntasAnexo4> preguntasLista;

  @override
  State<Anexo4CheckDialog> createState() => _Anexo4CheckDialogState();
}

class _Anexo4CheckDialogState extends State<Anexo4CheckDialog> {
  bool isSelectedSi = false;
  bool isSelectedNo = false;
  bool errorMessageBool = false;

  final PageController pageController = PageController(initialPage: 0);

  final List respuestasAnexo4 = [];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.preguntasLista.length,
      itemBuilder: (context, index) => AlertDialog(
        title: Column(
          children: [
            widget.preguntasLista[index].funciones == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 15),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: mainColor600),
                      child: Text(
                        widget.preguntasLista[index].funciones!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.preguntasLista[index].titulo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: mainColor600),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.preguntasLista[index].pregunta,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: const Text('SI'),
                    selected: isSelectedSi,
                    onSelected: (value) {
                      setState(() {
                        isSelectedSi = !isSelectedSi;
                        isSelectedNo = false;
                        value = isSelectedSi;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: const Text('No Corresponde'),
                    selected: isSelectedNo,
                    onSelected: (value) {
                      setState(() {
                        isSelectedNo = !isSelectedNo;
                        isSelectedSi = false;
                        value = isSelectedNo;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Visibility(
                  visible: errorMessageBool,
                  child: Text(
                    'Selecciona una opcion',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: color300),
                  ))
            ],
          ),
        ),
        actions: [
          Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Salir')),
                  TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: mainColor600),
                      onPressed: () {
                        if (false /*isSelectedNo == false && isSelectedSi == false*/) {
                          setState(() {
                            print('object');
                            errorMessageBool = true;
                          });
                        } else {
                          if (isSelectedSi == true) {
                            respuestasAnexo4.add(['X', '-']);
                          } else {
                            respuestasAnexo4.add(['-', 'X']);
                          }

                          isSelectedSi = false;
                          isSelectedNo = false;
                          errorMessageBool = false;

                          if (index + 1 == widget.preguntasLista.length) {
                            Navigator.pop(context);
                          } else {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          }

                          print(respuestasAnexo4);
                          //print(respuestasAnexo4[0][0]);
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
