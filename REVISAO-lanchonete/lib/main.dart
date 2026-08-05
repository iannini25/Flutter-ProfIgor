import 'package:flutter/material.dart';
import 'pages/tela_inicial.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lanchonete Express',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TelaInicial(),
    );
  }
}
