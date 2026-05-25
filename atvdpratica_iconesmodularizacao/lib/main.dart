import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/tela_home.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Meu App de Icones',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: TelaHome(),
    );
  }
}
