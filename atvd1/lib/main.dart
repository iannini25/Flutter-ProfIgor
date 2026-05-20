import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tela(),
    );
  }
}

class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bernardo Iannini'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          child: Column(
            children: [
              SizedBox(height: 16),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/pt/b/bd/Interestelar_P%C3%B4ster.png',
                height: 250,
              ),
              SizedBox(height: 16),
              Text(
                'Interestelar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Interestelar é um filme de ficção científica de 2014 '
                  'dirigido por Christopher Nolan. A história mostra um '
                  'grupo de astronautas que viaja por um buraco de minhoca '
                  'em busca de um novo planeta para a humanidade viver, '
                  'já que a Terra está ficando sem condições de vida.',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print("Botão pressionado!");
                },
                child: Text('Ver detalhes'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
