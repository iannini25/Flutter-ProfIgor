import 'package:flutter/material.dart';
import '../widgets/capa_musica.dart';
import 'tela_usuario.dart';

class TelaPlayer extends StatefulWidget {
  @override
  State<TelaPlayer> createState() => _TelaPlayerState();
}

class _TelaPlayerState extends State<TelaPlayer> {
  bool tocando = false;
  int volume = 5;
  int musicaAtual = 0;

  List musicas = [
    {
      'nome': 'Eduardo e monica',
      'artista': 'Legiao urbana',
      'genero': 'Rock',
      'duracao': '3:45',
      'icone': Icons.music_note,
      'cor': Colors.purple,
    },
    {
      'nome': 'Loop Infinito',
      'artista': 'Os Programadores',
      'genero': 'Pop',
      'duracao': '4:10',
      'icone': Icons.headphones,
      'cor': Colors.blue,
    },
    {
      'nome': 'Erro 404',
      'artista': 'Banda Bug',
      'genero': 'Eletronica',
      'duracao': '2:58',
      'icone': Icons.album,
      'cor': Colors.green,
    },
  ];

  void mudarPlay() {
    setState(() {
      if (tocando == true) {
        tocando = false;
      } else {
        tocando = true;
      }
    });
  }

  void aumentarVolume() {
    setState(() {
      if (volume < 10) {
        volume = volume + 1;
      }
    });
  }

  void diminuirVolume() {
    setState(() {
      if (volume > 0) {
        volume = volume - 1;
      }
    });
  }

  void proximaMusica() {
    setState(() {
      if (musicaAtual < 2) {
        musicaAtual = musicaAtual + 1;
      } else {
        musicaAtual = 0;
      }
    });
  }

  void maisInformacoes() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ' + musicas[musicaAtual]['nome']),
              Text('Artista: ' + musicas[musicaAtual]['artista']),
              Text('Gênero: ' + musicas[musicaAtual]['genero']),
              Text('Duração: ' + musicas[musicaAtual]['duracao']),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var musica = musicas[musicaAtual];

    // deixa a tela maior com a capa e as letras maiores
    double largura = MediaQuery.of(context).size.width;
    double tamanhoCapa = 150;
    double tamanhoTexto = 18;
    if (largura > 600) {
      tamanhoCapa = 250;
      tamanhoTexto = 26;
    }

    String status = 'Pausado';
    if (tocando == true) {
      status = 'Reproduzindo';
    }

    String textoBotao = 'Reproduzir';
    IconData iconeBotao = Icons.play_arrow;
    if (tocando == true) {
      textoBotao = 'Pausar';
      iconeBotao = Icons.pause;
    }

    String textoVolume = 'Volume: ' + volume.toString();
    if (volume == 0) {
      textoVolume = '🔇 Sem som';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Player'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CapaMusica(
                icone: musica['icone'],
                cor: musica['cor'],
                tocando: tocando,
                tamanho: tamanhoCapa,
              ),
              SizedBox(height: 20),
              Text(
                'Música: ' + musica['nome'],
                style: TextStyle(fontSize: tamanhoTexto),
              ),
              Text(
                'Artista: ' + musica['artista'],
                style: TextStyle(fontSize: tamanhoTexto),
              ),
              Text(
                'Status: ' + status,
                style: TextStyle(fontSize: tamanhoTexto),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: mudarPlay,
                icon: Icon(iconeBotao),
                label: Text(textoBotao),
              ),
              SizedBox(height: 20),
              Text(textoVolume),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: diminuirVolume,
                    child: Text('Volume -'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: aumentarVolume,
                    child: Text('Volume +'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: proximaMusica,
                child: Text('Próxima música'),
              ),
              ElevatedButton(
                onPressed: maisInformacoes,
                child: Text('Mais informações'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaUsuario(),
                    ),
                  );
                },
                child: Text('Tela do usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
