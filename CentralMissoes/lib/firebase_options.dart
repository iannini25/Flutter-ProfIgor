import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBPSGt4n5C1FEWBEJupwwqUHQ0PlOU4iYA',
    appId: '1:109391888599:web:ca7724d8bc80f421d8f092',
    messagingSenderId: '109391888599',
    projectId: 'central-missoes',
    authDomain: 'central-missoes.firebaseapp.com',
    storageBucket: 'central-missoes.firebasestorage.app',
  );
}
