// esse arquivo e gerado pelo comando:
// dart pub global run flutterfire_cli:flutterfire configure
// rodar o comando pra trocar pelos dados do projeto do firebase
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'COLOCAR_AQUI',
    appId: 'COLOCAR_AQUI',
    messagingSenderId: 'COLOCAR_AQUI',
    projectId: 'COLOCAR_AQUI',
    authDomain: 'COLOCAR_AQUI',
    storageBucket: 'COLOCAR_AQUI',
  );
}
