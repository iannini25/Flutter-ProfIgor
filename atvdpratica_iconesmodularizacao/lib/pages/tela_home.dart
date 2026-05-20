import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'pagina_perfil.dart';
import 'pagina_favoritos.dart';
import 'pagina_mensagens.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = 'Clique em um botao';

  void mudarMensagem(String texto) {
    setState(() {
      mensagem = texto;
    });
  }

  void abrirModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            children: [
              const Text(
                'Configuracoes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Esse e o menu de configuracoes rapidas.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App de Icones'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                mensagem,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CardIcone(
              icone: Icons.person,
              titulo: 'Perfil',
              descricao: 'Ver os dados do seu perfil',
              textoBotao: 'Abrir',
              cor: Colors.blue,
              onPressed: () {
                mudarMensagem('Voce clicou em Perfil');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaPerfil(),
                  ),
                );
              },
            ),
            CardIcone(
              icone: Icons.favorite,
              titulo: 'Favoritos',
              descricao: 'Ver seus itens favoritos',
              textoBotao: 'Abrir',
              cor: Colors.red,
              onPressed: () {
                mudarMensagem('Voce clicou em Favoritos');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaFavoritos(),
                  ),
                );
              },
            ),
            CardIcone(
              icone: Icons.message,
              titulo: 'Mensagens',
              descricao: 'Ver as mensagens recebidas',
              textoBotao: 'Abrir',
              cor: Colors.green,
              onPressed: () {
                mudarMensagem('Voce clicou em Mensagens');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaMensagens(),
                  ),
                );
              },
            ),
            CardIcone(
              icone: Icons.settings,
              titulo: 'Configuracoes',
              descricao: 'Abrir o menu de configuracoes',
              textoBotao: 'Abrir',
              cor: Colors.orange,
              onPressed: () {
                mudarMensagem('Voce clicou em Configuracoes');
                abrirModal();
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Feito por Bernardo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          mudarMensagem('Botao flutuante clicado!');
        },
        child: const Icon(Icons.touch_app, color: Colors.white),
      ),
    );
  }
}
