import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final campoNome = TextEditingController();
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();

  void cadastrar() async {
    try {
      final resultado = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: campoEmail.text,
        password: campoSenha.text,
      );
      await resultado.user!.updateDisplayName(campoNome.text);

      await FirebaseFirestore.instance.collection('usuarios').doc(resultado.user!.uid).set({
        'nome': campoNome.text,
        'email': campoEmail.text,
      });

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('erro no cadastro')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Column(
        children: [
          TextField(
            controller: campoNome,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: campoEmail,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: campoSenha,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
          ElevatedButton(onPressed: cadastrar, child: const Text('Cadastrar')),
        ],
      ),
    );
  }
}
