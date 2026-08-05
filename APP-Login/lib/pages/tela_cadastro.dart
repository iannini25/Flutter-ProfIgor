import 'package:flutter/material.dart';
import 'tela_home.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final campoNome = TextEditingController();
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();
  final campoConfirmar = TextEditingController();

  String mensagem = '';
  Color corMensagem = Colors.red;

  void cadastrar() {
    String nome = campoNome.text;
    String email = campoEmail.text;
    String senha = campoSenha.text;
    String confirmar = campoConfirmar.text;

    if (nome == '') {
      setState(() {
        mensagem = 'Digite seu nome';
        corMensagem = Colors.red;
      });
    } else if (email == '') {
      setState(() {
        mensagem = 'Digite seu email';
        corMensagem = Colors.red;
      });
    } else if (!email.contains('@')) {
      setState(() {
        mensagem = 'Digite um email válido';
        corMensagem = Colors.red;
      });
    } else if (senha == '') {
      setState(() {
        mensagem = 'Digite sua senha';
        corMensagem = Colors.red;
      });
    } else if (senha.length < 6) {
      setState(() {
        mensagem = 'A senha precisa ter pelo menos 6 caracteres';
        corMensagem = Colors.red;
      });
    } else if (confirmar != senha) {
      setState(() {
        mensagem = 'As senhas não são iguais';
        corMensagem = Colors.red;
      });
    } else {
      setState(() {
        mensagem = 'Cadastro realizado com sucesso!';
        corMensagem = Colors.green;
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
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
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
                  Icons.person_add,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Criar Conta',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: campoNome,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
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
                TextField(
                  controller: campoConfirmar,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar senha',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: corMensagem),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: cadastrar,
                  child: const Text('Cadastrar'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar para Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
