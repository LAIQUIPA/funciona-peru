import 'package:cloud_firestore/cloud_firestore.dart';

class AprendeClass {
  late String imgUrl;
  late String titulo;
  late String descripcion;
  late List boxData;

  Future<Stream<QuerySnapshot>> getAprendedata(String category) async {
    return await FirebaseFirestore.instance
        .collection('AprendeGame')
        .doc('AprendeBox')
        .collection(category)
        .snapshots();
  }

  Future addAprendeData(
      Map<String, dynamic> userAprendeData, String category) async {
    await FirebaseFirestore.instance
        .collection('AprendeGame')
        .doc('AprendeBox')
        .collection(category)
        .add(userAprendeData);
  }

  Future addAprendeBoxItem(List data, String category, String docId) async {
    await FirebaseFirestore.instance
        .collection('AprendeGame')
        .doc('AprendeBox')
        .collection(category)
        .doc(docId)
        .update({
      'data': FieldValue.arrayUnion(data),
    });
  }
}
