import 'package:flutter/material.dart';

// Pesquisa sobre o ListTile:
// O ListTile e um widget que cria uma linha pronta com icone, titulo e descricao.
// Pode ser usado em menus, listas, configuracoes e paginas de detalhes.
// leading: e o que vem no comeco da linha (geralmente um icone)
// title: e o texto principal da linha
// subtitle: e o texto menor que aparece embaixo do titulo

class PaginaFavoritos extends StatelessWidget {
  const PaginaFavoritos({super.key});

  // funcao do modal pra mostrar mais infos
  void abrirModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 180,
          child: Column(
            children: [
              const Text(
                'Sobre os Favoritos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Essa e a lista dos meus favoritos.'),
              const SizedBox(height: 15),
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
        title: const Text('Favoritos'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.favorite,
              size: 90,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            const Text(
              'Pagina dos Favoritos',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Aqui ficam as coisas que eu mais gosto :)'),
            const SizedBox(height: 20),

            // container com borda arredondada pra deixar bonito
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red, width: 1),
              ),
              child: Column(
                children: [
                  // ListTile e usado pra criar uma linha com icone, titulo e descricao
                  ListTile(
                    leading: const Icon(Icons.movie, color: Colors.red),
                    title: const Text('Filmes Favoritos'),
                    subtitle: const Text('Lista dos filmes que mais gosto'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.sports_esports, color: Colors.red),
                    title: const Text('Jogos Favoritos'),
                    subtitle: const Text('Meus jogos preferidos'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.music_note, color: Colors.red),
                    title: const Text('Musicas Favoritas'),
                    subtitle: const Text('As musicas que eu mais escuto'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.red),
                    title: const Text('Livros Favoritos'),
                    subtitle: const Text('Livros que eu ja li e gostei'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                abrirModal(context);
              },
              icon: const Icon(Icons.info),
              label: const Text('Mais Info'),
            ),
            const SizedBox(height: 10),

            // botao de voltar usando Navigator.pop
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
