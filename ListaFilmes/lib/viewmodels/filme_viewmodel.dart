import 'package:flutter/material.dart';
import '../models/filme.dart';
import '../services/filme_service.dart';

class FilmeViewModel extends ChangeNotifier {
  final servico = FilmeService();
  List<Filme> filmes = [];

  Future<void> carregar() async {
    filmes = await servico.listar();
    notifyListeners();
  }

  Future<void> adicionar(String titulo) async {
    final filme = Filme(titulo: titulo);
    await servico.inserir(filme);
    await carregar();
  }

  Future<void> mudarAssistido(Filme filme, bool valor) async {
    filme.assistido = valor;
    await servico.atualizar(filme);
    await carregar();
  }
}
