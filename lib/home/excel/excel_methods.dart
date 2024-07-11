import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class excelMehtods extends StatefulWidget {
  final String category;
  const excelMehtods({super.key, required this.category});

  @override
  State<excelMehtods> createState() => _excelMehtodsState();
}

class _excelMehtodsState extends State<excelMehtods> {
  String? documentUrl;
  Future<String> generateDocument(
      String? apiKey, String? documentId, String? format, dynamic data) async {
    final requestData = {
      'apiKey': apiKey,
      'document': documentId != null ? documentId : 'sample',
      'data': data != null ? data : {},
      'format': format != null ? format : ''
    };

    final headers = {'Content-type': 'application/json'};

    final response = await http.post(
      Uri.parse('https://app.documentero.com/api'),
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

  readExcel() async {
    ByteData data = await rootBundle.load("assets/excel/anexo_1.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]!.maxColumns);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print('$row');
      }
    }
  }

  Future<void> exportExcel() async {
    hola() {}
    //Excel excel1 = Excel.createExcel();
    //excel1.rename(excel.getDefaultSheet()!, "anexo_1");
    /// Use FilePicker to pick files in Flutter Web

    /*if (kIsWeb) {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,

      );

      /// file might be picked

      if (pickedFile != null) {
        var bytes = pickedFile.files.single.bytes;
        var excel = Excel.decodeBytes(bytes);
      }
    }*/
    //READ DATA EXCEL
    //var data = await rootBundle.load('assets/excel/anexo_1.xlsx');
    var data = await rootBundle.load('assets/excel/nuevo1.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel1 = Excel.decodeBytes(bytes);

    Sheet sheet = excel1[excel1.getDefaultSheet()!];

    //COLUMNAS ANCHOS
    sheet.setColumnWidth(0, 0.38 + 0.22); //colA
    sheet.setColumnWidth(1, 12.11 + 0.578); //colB
    sheet.setColumnWidth(2, 10.78); //colC
    sheet.setColumnWidth(3, 12.89 + 0.67); //colD
    sheet.setColumnWidth(4, 6.56 + 0.61); //colE
    sheet.setColumnWidth(5, 6.22); //colF
    sheet.setColumnWidth(6, 12.67); //colG
    sheet.setColumnWidth(7, 5.33); //colH
    sheet.setColumnWidth(8, 10.11); //colI
    sheet.setColumnWidth(9, 14.78); //colJ
    sheet.setColumnWidth(10, 12.89); //colK
    sheet.setColumnWidth(11, 20.56); //colL
    sheet.setColumnWidth(12, 17.33); //colM
    //int replace = sheet.findAndReplace('fsdf', 'aweee', startingRow: 19);
    //print(replace);

    //FILAS ALTOS
    sheet.setRowHeight(0, 81.8); //encabezado
    //var cell =
    //    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 5));
    //CELL STYLE

    CellStyle cellStyle = CellStyle(
      fontFamily: getFontFamily(FontFamily.Arial_Narrow),
      //backgroundColorHex: ExcelColor.fromHexString("#1AFF1A"),
      fontSize: 10,
      verticalAlign: VerticalAlign.Center,
      horizontalAlign: HorizontalAlign.Center,
    );
    //CAMBIOS
    var cell = sheet.cell(CellIndex.indexByString("D4"));
    cell.value = const TextCellValue("ITSE");
    cell.cellStyle = cellStyle;

    /*var cell2 = sheet.cell(CellIndex.indexByString("D9"));
    cell2.value = TextCellValue("PRUEBAAAA");
    cell2.cellStyle =
        CellStyle(backgroundColorHex: ExcelColor.fromHexString("1AFF1A"));*/

    //SAVE ON WEB
    if (kIsWeb) {
      var fileBytes = excel1.save(fileName: "anexo_1-ITSE.xlsx");
    } else {
      //SAVE ON ANDROID-IOS
      var fileBytes = excel1.save(fileName: "anexo_1-ITSE.xlsx");
      //var fileBytes = excel.save();
      var downloads = await getDownloadsDirectory();
      final other = downloads!.path;

      final file = File(("$other/anexo_1.xlsx"));
      //..createSync(recursive: true)
      file.writeAsBytesSync(fileBytes!, flush: true);
    }
  }

  Future<void> writeExcel() async {
    var excel = Excel.createExcel();

    // Add a new sheet
    Sheet sheetObject = excel['Sheet1'];

    // Write data to cells
    sheetObject.cell(CellIndex.indexByString('A1')).value =
        const TextCellValue("value");
    sheetObject.cell(CellIndex.indexByString('B1')).value =
        const TextCellValue('value');

    // Save the Excel file

    Directory directory = await getApplicationDocumentsDirectory();
    var dir = await getDownloadsDirectory();
    final other = dir!.path;
    print(other);
    print(dir);

    final file = File(("$other/anexo_1.xlsx"));
    var onValue = await excel.encode();
    await file.writeAsBytes(onValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comienza'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                exportExcel();
              },
              child: const Text('Descargar')),
          ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );

                documentUrl = await generateDocument(
                    'I56LX5Q-P2OEW4I-W5T6JBI-VLSTC2A',
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
                Navigator.pop(context);
                await launchUrl(
                  Uri.parse(documentUrl.toString()),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Text('Documentero')),
        ],
      ),
    );
  }
}
