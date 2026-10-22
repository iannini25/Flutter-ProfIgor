import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCR7TTD7T6BgHkW_ZizEq-gqVDAEDV9Lak',
    appId: '1:419299532454:web:45cddd6e9ea78dbeadde67',
    messagingSenderId: '419299532454',
    projectId: 'cadastro-feiticeiros',
    authDomain: 'cadastro-feiticeiros.firebaseapp.com',
    storageBucket: 'cadastro-feiticeiros.firebasestorage.app',
  );
}
