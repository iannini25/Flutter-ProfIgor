import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/produto_provider.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProdutoProvider>(context, listen: false).carregar();
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ESTOQUE')),
      body: ListView.builder(
        itemCount: produtoProvider.produtos.length,
        itemBuilder: (context, i) {
          final produto = produtoProvider.produtos[i];

          return Column(
            children: [
              Text(produto.nome),
              Text(produto.categoria),
              Text('Quantidade: ${produto.quantidade}'),
              Text('R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}'),
              if (produto.quantidade <= 3) const Text('ESTOQUE BAIXO'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      produtoProvider.mudarQuantidade(produto, produto.quantidade - 1);
                    },
                    child: const Text('-'),
                  ),
                  Text('Quantidade: ${produto.quantidade}'),
                  ElevatedButton(
                    onPressed: () {
                      produtoProvider.mudarQuantidade(produto, produto.quantidade + 1);
                    },
                    child: const Text('+'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  produtoProvider.excluir(produto);
                },
                child: const Text('EXCLUIR'),
              ),
              const Text('----------------'),
            ],
          );
        },
      ),
    );
  }
}
