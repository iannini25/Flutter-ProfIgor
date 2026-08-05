import 'package:flutter/material.dart';
import 'tela_cadastro.dart';
import 'tela_home.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();

  String erro = '';

  void entrar() {
    String email = campoEmail.text;
    String senha = campoSenha.text;

    if (email == '') {
      setState(() {
        erro = 'Digite seu email';
      });
    } else if (!email.contains('@')) {
      setState(() {
        erro = 'Digite um email válido';
      });
    } else if (senha == '') {
      setState(() {
        erro = 'Digite sua senha';
      });
    } else {
      setState(() {
        erro = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaHome(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.lock,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Entre com seu email e senha',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: campoEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: campoSenha,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  erro,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: entrar,
                  child: const Text('Entrar'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaCadastro(),
                      ),
                    );
                  },
                  child: const Text('Criar conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
