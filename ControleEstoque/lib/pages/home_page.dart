import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';
import 'cadastro_produto_page.dart';
import 'estoque_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('CONTROLE DE ESTOQUE')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Olá, ${usuarioProvider.usuarioLogado!.nome}!'),
            const Text('CONTROLE DE ESTOQUE'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EstoquePage()),
                );
              },
              child: const Text('VER PRODUTOS'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroProdutoPage()),
                );
              },
              child: const Text('CADASTRAR PRODUTO'),
            ),
            ElevatedButton(
              onPressed: () {
                usuarioProvider.sair();
                Navigator.pop(context);
              },
              child: const Text('SAIR'),
            ),
          ],
        ),
      ),
    );
  }
}
