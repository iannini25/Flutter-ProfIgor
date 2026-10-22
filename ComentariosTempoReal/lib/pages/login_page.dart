import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();

  void entrar() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: campoEmail.text,
        password: campoSenha.text,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('erro no login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: campoEmail,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: campoSenha,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
          ElevatedButton(onPressed: entrar, child: const Text('Entrar')),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CadastroPage()),
              );
            },
            child: const Text('Criar conta'),
          ),
        ],
      ),
    );
  }
}
