import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/admin_panel/service/database.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class TramiteDatosSolicitante extends StatelessWidget {
  const TramiteDatosSolicitante({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;

    //controlladores
    //datos del solcitante
    final nombresApellidosController = TextEditingController();
    final dniController = TextEditingController();
    final domiciloController = TextEditingController();
    final correoController = TextEditingController();
    final telefonoController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: color800, borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Datos del Solicitante',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            const SizedBox(height: 15),
            TramiteTextField(
                nombre: 'Nombres y Apellidos',
                controller: nombresApellidosController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'DNI',
                controller: dniController,
                keyboardType: TextInputType.number),
            TramiteTextField(
                nombre: 'Domicilio',
                controller: domiciloController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Correo',
                controller: correoController,
                keyboardType: TextInputType.emailAddress),
            TramiteTextField(
                nombre: 'Telefono/Celular',
                controller: telefonoController,
                keyboardType: TextInputType.number),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: ContinuarButton(
                  onTap: () async {
                    await DatabaseMethods().addPersonaDatos({
                      'nombres y apellidos': nombresApellidosController.text,
                      'dni': dniController.text,
                      'domicilio': correoController.text,
                      'telefonocelular': telefonoController.text,
                    }, email!);
                    onTap!();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class TramitePJoPN extends StatelessWidget {
  const TramitePJoPN({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email!;
    nextEspecificPagePass(int page) async {
      if (pageController.hasClients) {
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      }
    }

    addCarpeta() async {
      await DatabaseMethods().addPersonaDoc(email);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Escoje una opcion',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 80),
            ElevatedButton(
                onPressed: () async {
                  await addCarpeta();
                  nextEspecificPagePass(2);
                },
                child: Text(
                  'Persona Natural',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  await addCarpeta();
                  nextEspecificPagePass(1);
                },
                child: Text(
                  'Persona Juridica',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
          ],
        ),
      ),
    );
  }
}

class TramiteDatosEstablecimiento extends StatelessWidget {
  const TramiteDatosEstablecimiento({
    super.key,
    required this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email!;
    //datos del establecimiento
    final razonSocialController = TextEditingController();
    final rucController = TextEditingController();
    final nombreComercialController = TextEditingController();
    final telefono2Controller = TextEditingController();
    final direccionController = TextEditingController();
    final distritoController = TextEditingController();
    final provinciaController = TextEditingController();
    final departamentoController = TextEditingController();
    final giroController = TextEditingController();
    final areaController = TextEditingController();
    final numPisosController = TextEditingController();
    final pisoUbicadoController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: color800, borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Datos del Establecimiento',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            const SizedBox(height: 15),
            TramiteTextField(
              nombre: 'Razon Social',
              controller: razonSocialController,
              keyboardType: TextInputType.text,
            ),
            TramiteTextField(
                nombre: 'RUC',
                controller: rucController,
                keyboardType: TextInputType.number),
            TramiteTextField(
                nombre: 'Nombre Comercial',
                controller: nombreComercialController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Telefono',
                controller: telefono2Controller,
                keyboardType: TextInputType.number),
            TramiteTextField(
                nombre: 'Dirección del Establecimiento',
                controller: direccionController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Distrito',
                controller: distritoController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Provincia',
                controller: provinciaController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Departamento',
                controller: departamentoController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Giro',
                controller: giroController,
                keyboardType: TextInputType.text),
            TramiteTextField(
                nombre: 'Area',
                controller: areaController,
                keyboardType: TextInputType.number),
            TramiteTextField(
                nombre: 'Numero de Pisos de la edificación',
                controller: numPisosController,
                keyboardType: TextInputType.number),
            TramiteTextField(
                nombre: 'Piso donde se encuentra ubicado el establecimiento',
                controller: pisoUbicadoController,
                keyboardType: TextInputType.number),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: ContinuarButton(
                  onTap: () async {
                    await DatabaseMethods().addPersonaDatos({
                      'razon social': razonSocialController.text,
                      'ruc': rucController.text,
                      'nombre comercial': nombreComercialController.text,
                      'telefono': telefono2Controller.text,
                      'direccion': direccionController.text,
                      'distrito': distritoController.text,
                      'provincia': provinciaController.text,
                      'departamento': departamentoController.text,
                      'giro': giroController.text,
                      'area': areaController.text,
                      'num pisos': numPisosController.text,
                      'piso ubicado': pisoUbicadoController.text,
                    }, email);
                    onTap!();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class TramiteTextField extends StatelessWidget {
  const TramiteTextField({
    super.key,
    required this.nombre,
    required this.controller,
    required this.keyboardType,
  });

  final String nombre;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //RUC
        Text(
          nombre,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Click aqui para escribir',
              hintStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const Divider(
          thickness: 3,
        ),
      ],
    );
  }
}

class ContinuarButton extends StatelessWidget {
  const ContinuarButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Continuar', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: ElevatedButton(
              onPressed: onTap,
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  shape: const WidgetStatePropertyAll(CircleBorder())),
              child: const Icon(Icons.arrow_forward_ios_rounded)),
        ),
      ],
    );
  }
}

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? documentUrl;

    Future<String> generateDocument(String? apiKey, String? documentId,
        String? format, dynamic data) async {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comienza'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            //GENERAR DOCUMENTO BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Anexos\nCompletos',
                    style: Theme.of(context).textTheme.bodyLarge),
                ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                    child: Text(
                      'Generar\nDocumento',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
