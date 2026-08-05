import 'package:flutter/material.dart';
import 'pages/tela_clima.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima Agora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaClima(),
    );
  }
}
