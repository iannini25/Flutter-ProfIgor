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
    apiKey: 'AIzaSyC6XVTMT48IapLVQs92_ZkCXFP4OsexaeI',
    appId: '1:335708251534:web:fe6127486a3f6c613cb0df',
    messagingSenderId: '335708251534',
    projectId: 'central-achados-ece83',
    authDomain: 'central-achados-ece83.firebaseapp.com',
    storageBucket: 'central-achados-ece83.firebasestorage.app',
  );
}
