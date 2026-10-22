import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyWDaaarvPXRkP1f6F3CNb1JkGpR_qGHU',
    appId: '1:637070400359:web:b943596cf6454ace5cadc2',
    messagingSenderId: '637070400359',
    projectId: 'comentarios-tempo-real',
    authDomain: 'comentarios-tempo-real.firebaseapp.com',
    storageBucket: 'comentarios-tempo-real.firebasestorage.app',
  );
}
