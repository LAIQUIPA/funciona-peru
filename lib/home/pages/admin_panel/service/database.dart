import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addPreguntaCategoria(
      Map<String, dynamic> userQuizzCategory, String category) async {
    await FirebaseFirestore.instance
        .collection('JuegaGame')
        .doc('Quizz')
        .collection(category)
        .add(userQuizzCategory);
  }

  Future<Stream<QuerySnapshot>> getCateriasQuizz(String category) async {
    return /*await*/ FirebaseFirestore.instance
        .collection('JuegaGame')
        .doc('Quizz')
        .collection(category)
        .snapshots();
  }

  Future updatePreguntaCategoria(Map<String, dynamic> updatedPregunta,
      String category, String docId) async {
    await FirebaseFirestore.instance
        .collection('JuegaGame')
        .doc('Quizz')
        .collection(category)
        .doc(docId)
        .update(updatedPregunta);
  }

  //add game status
  Future addGameResultado(
      Map<String, dynamic> userQuizzCategory, String email) async {
    await FirebaseFirestore.instance
        .collection('JuegaGame')
        .doc('Resultados')
        .collection(email)
        .add(userQuizzCategory);
  }

  Future<Stream<QuerySnapshot>> getResultados(String email) async {
    return /*await*/ FirebaseFirestore.instance
        .collection('JuegaGame')
        .doc('Resultados')
        .collection(email)
        .snapshots();
  }

  //ADD DATOS SOLCIITANTE
  Future addPersonaDoc(String email) async {
    await FirebaseFirestore.instance
        .collection('ComienzaGame')
        .doc('Datos')
        .collection(email)
        .doc('info')
        .set({});
  }

  Future addPersonaDatos(
      Map<String, dynamic> userQuizzCategory, String email) async {
    await FirebaseFirestore.instance
        .collection('ComienzaGame')
        .doc('Datos')
        .collection(email)
        .doc('info')
        .update(userQuizzCategory);
  }

  //GET DATA PARA PROFILE PAGE
  Future<Stream<DocumentSnapshot>> getProfileData(String email) async {
    return /*await*/ FirebaseFirestore.instance
        .collection('ComienzaGame')
        .doc('Datos')
        .collection(email)
        .doc('info')
        .snapshots();
  }
}
