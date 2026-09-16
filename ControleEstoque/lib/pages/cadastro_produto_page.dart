import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/produto_provider.dart';

class CadastroProdutoPage extends StatefulWidget {
  const CadastroProdutoPage({super.key});

  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final nome = TextEditingController();
  final categoria = TextEditingController();
  final quantidade = TextEditingController();
  final preco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('CADASTRAR PRODUTO')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Nome:'),
            TextField(controller: nome),
            const Text('Categoria:'),
            TextField(controller: categoria),
            const Text('Quantidade:'),
            TextField(controller: quantidade),
            const Text('Preço:'),
            TextField(controller: preco),
            ElevatedButton(
              onPressed: () async {
                await produtoProvider.cadastrar(
                  nome.text,
                  categoria.text,
                  int.parse(quantidade.text),
                  double.parse(preco.text),
                );
                Navigator.pop(context);
              },
              child: const Text('CADASTRAR PRODUTO'),
            ),
          ],
        ),
      ),
    );
  }
}
