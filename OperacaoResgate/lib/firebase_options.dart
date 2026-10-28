import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError('so foi configurado pra web');
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
