import 'package:flutter/material.dart';
import 'pages/tela_player.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Player',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TelaPlayer(),
    );
  }
}

