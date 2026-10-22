import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void entrarComGoogle() async {
    await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ESCOLA JUJUTSU'),
            const Text('Acesso restrito para feiticeiros'),
            ElevatedButton(
              onPressed: entrarComGoogle,
              child: const Text('ENTRAR COM GOOGLE'),
            ),
          ],
        ),
      ),
    );
  }
}
