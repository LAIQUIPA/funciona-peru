import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/admin_panel/service/database.dart';

class ResultadosPage extends StatelessWidget {
  const ResultadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Mis resultados',
              style: theme.titleLarge,
            ),
            const AllResultados(),
          ]),
        ),
      ),
    );
  }
}

class AllResultados extends StatefulWidget {
  const AllResultados({
    super.key,
  });

  @override
  State<AllResultados> createState() => _AllResultadosState();
}

class _AllResultadosState extends State<AllResultados> {
  Stream? stream;
  //auth
  final email = FirebaseAuth.instance.currentUser!.email!;

  getontheLoad() async {
    stream = await DatabaseMethods().getResultados(email);
    setState(() {});
  }

  @override
  void initState() {
    getontheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return ExpansionTile(
                      title: Text('Resultado ${index + 1}: ${ds['categoria']}'),
                      children: [
                        Text('Tiempo: ${ds['tiempo']}'),
                        Text('Preguntas: ${ds['preguntas']}'),
                        Text('Acertadas: ${ds['acertadas']}'),
                        Text('Fallidas: ${ds['fallidas']}'),
                        Text('Porcentaje: ${ds['porcentaje']}'),
                      ],
                    );
                  },
                ),
              )
            : const Center(
              child: Text('Sin datos'),
            );
      },
    );
  }
}
