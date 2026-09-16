import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../services/produto_service.dart';

class ProdutoProvider extends ChangeNotifier {
  final servico = ProdutoService();
  List<Produto> produtos = [];

  Future<void> carregar() async {
    produtos = await servico.listar();
    await servico.mostrarProdutosNoTerminal();
    notifyListeners();
  }

  Future<void> cadastrar(String nome, String categoria, int quantidade, double preco) async {
    final produto = Produto(
      nome: nome,
      categoria: categoria,
      quantidade: quantidade,
      preco: preco,
    );
    await servico.cadastrar(produto);
    await carregar();
  }

  Future<void> mudarQuantidade(Produto produto, int novaQuantidade) async {
    await servico.mudarQuantidade(produto, novaQuantidade);
    await carregar();
  }

  Future<void> excluir(Produto produto) async {
    await servico.excluir(produto);
    await carregar();
  }
}
