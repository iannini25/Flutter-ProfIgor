import 'package:flutter/material.dart';

class TelaUsuario extends StatefulWidget {
  @override
  State<TelaUsuario> createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoEstilo = TextEditingController();

  String nome = '';
  String estilo = '';

  void salvar() {
    setState(() {
      nome = campoNome.text;
      estilo = campoEstilo.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: campoNome,
                decoration: InputDecoration(labelText: 'Nome do usuário'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: campoEstilo,
                decoration: InputDecoration(labelText: 'Estilo musical favorito'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: salvar,
                child: Text('Salvar'),
              ),
              SizedBox(height: 20),
              Text('Nome: ' + nome),
              Text('Estilo: ' + estilo),
            ],
          ),
        ),
      ),
    );
  }
}
