import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'viewmodels/filme_viewmodel.dart';
import 'pages/pagina_inicial.dart';

void main() {
  databaseFactory = databaseFactoryFfiWeb;

  runApp(
    ChangeNotifierProvider(
      create: (context) => FilmeViewModel(),
      child: const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginaInicial(),
    );
  }
}
