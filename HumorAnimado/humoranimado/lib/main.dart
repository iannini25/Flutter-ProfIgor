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

class Tela extends StatefulWidget {
  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  String humor = '';

  Color cor = Colors.grey;
  double tamanho = 150;
  IconData icone = Icons.sentiment_neutral;
  String texto = 'Escolha um humor';
  double borda = 10;

  String mensagem = '';
  bool mostrar = false;

  void escolherHumor(String novoHumor) {
    setState(() {
      humor = novoHumor;
      mostrar = true;

      if (novoHumor == 'Feliz') {
        cor = Colors.yellow;
        tamanho = 250;
        icone = Icons.sentiment_very_satisfied;
        texto = 'Hoje estou feliz!';
        borda = 100;
        mensagem = 'Voce escolheu o humor Feliz. Que bom ver essa energia positiva!';
      } else if (novoHumor == 'Triste') {
        cor = Colors.blueGrey;
        tamanho = 180;
        icone = Icons.sentiment_very_dissatisfied;
        texto = 'Hoje estou meio triste.';
        borda = 20;
        mensagem = 'Voce escolheu o humor Triste. Vai passar, fica tranquilo.';
      } else if (novoHumor == 'Animado') {
        cor = Colors.orange;
        tamanho = 230;
        icone = Icons.bolt;
        texto = 'Energia total!';
        borda = 60;
        mensagem = 'Voce escolheu o humor Animado. Bora com tudo!';
      } else if (novoHumor == 'Calmo') {
        cor = Colors.blue;
        tamanho = 200;
        icone = Icons.cloud;
        texto = 'Momento de tranquilidade.';
        borda = 40;
        mensagem = 'Voce escolheu o humor Calmo. Hora de relaxar.';
      }
    });
  }

  Widget montarCena() {
    List<IconData> icones = [];

    if (humor == 'Feliz') {
      icones = [Icons.wb_sunny, Icons.auto_awesome, Icons.star];
    } else if (humor == 'Triste') {
      icones = [Icons.water_drop, Icons.cloud, Icons.water_drop];
    } else if (humor == 'Animado') {
      icones = [Icons.bolt, Icons.star, Icons.bolt];
    } else if (humor == 'Calmo') {
      icones = [Icons.cloud, Icons.water_drop, Icons.cloud];
    }

    return TweenAnimationBuilder<double>(
      key: ValueKey(humor),
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 900),
      builder: (context, valor, child) {
        return Transform.scale(
          scale: valor,
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icones[0], size: 50, color: cor),
          SizedBox(width: 10),
          Icon(icones[1], size: 50, color: cor),
          SizedBox(width: 10),
          Icon(icones[2], size: 50, color: cor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Mood App',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Escolha um humor e veja a tela mudar!'),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    escolherHumor('Feliz');
                  },
                  child: Text('Feliz'),
                ),
                ElevatedButton(
                  onPressed: () {
                    escolherHumor('Triste');
                  },
                  child: Text('Triste'),
                ),
                ElevatedButton(
                  onPressed: () {
                    escolherHumor('Animado');
                  },
                  child: Text('Animado'),
                ),
                ElevatedButton(
                  onPressed: () {
                    escolherHumor('Calmo');
                  },
                  child: Text('Calmo'),
                ),
              ],
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: tamanho,
              height: tamanho,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(borda),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icone, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      texto,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: mostrar ? 1 : 0,
              duration: Duration(milliseconds: 800),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 30),
            if (humor != '') montarCena(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
