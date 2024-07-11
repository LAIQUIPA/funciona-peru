import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_components/aprende_boxclass.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddAprendeData extends StatefulWidget {
  const AddAprendeData({super.key});

  @override
  State<AddAprendeData> createState() => _AddAprendeDataState();
}

class _AddAprendeDataState extends State<AddAprendeData> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  String? value;
  final List<String> dropButtonList = ['Licencia', 'ITSE'];
  TextEditingController tituloController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        tituloController.text != "" &&
        descripcionController.text != "") {
      //Dialog
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      //database method
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('AprendeDataImages')
          .child(addId);

      final UploadTask task = firebaseStorageRef.putFile(
          selectedImage!, SettableMetadata(contentType: 'image/jpeg'));

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addAprendeData = {
        'image': downloadUrl,
        'titulo': tituloController.text,
        'descripcion': descripcionController.text,
        'data':[],
      };
      await AprendeClass().addAprendeData(addAprendeData, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: mainColor600,
            content: SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  "Los datos se agregaron exitosamente",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            )));
      });
      //pop dialog
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            'Falta completar los campos',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        ),
      );
    }
  }

  /*getFutureData(BuildContext context, var future) async {
  var data;
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: FutureBuilder(
        future: DatabaseMethods()
          .addPreguntaCategoria(addQuizz, value!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            data = snapshot.data;
            Navigator.pop(context);
          }
          return CircularProgressIndicator();
        },
      ),
    ),
  );
  return data;
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Añadir Aprende Data',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sube una Imagen de fondo',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            selectedImage == null
                ? GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: scaffoldBackgroundColor,
                              border: Border.all(color: greyColor, width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: scaffoldBackgroundColor,
                            border: Border.all(color: greyColor, width: 1.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            //Titulo
            Text(
              'Titulo',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: tituloController,
                cursorColor: Colors.black,
                style: const TextStyle(color: scaffoldBackgroundColor),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //Descripción
            Text(
              'Descripción',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: descripcionController,
                cursorColor: Colors.black,
                style: const TextStyle(color: scaffoldBackgroundColor),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //DROPDOWN BUTTON
            Text(
              'Categoria',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: dropButtonList
                      .map(
                        (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: scaffoldBackgroundColor))),
                      )
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  value: value,
                  dropdownColor: Colors.grey[200],
                  hint: Text(
                    'Selecciona una Categoria',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                  iconSize: 36,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            //BOTON SUBMIT
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    uploadItem();
                  },
                  child: Text(
                    'Enviar',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
