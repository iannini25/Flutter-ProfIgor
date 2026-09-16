import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'providers/usuario_provider.dart';
import 'providers/produto_provider.dart';
import 'pages/login_page.dart';

void main() {
  databaseFactory = databaseFactoryFfiWeb;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsuarioProvider()),
        ChangeNotifierProvider(create: (context) => ProdutoProvider()),
      ],
      child: const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
