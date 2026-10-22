import 'package:flutter/material.dart';
import '../models/missao.dart';
import '../services/missao_service.dart';

class MissaoProvider extends ChangeNotifier {
  final servico = MissaoService();
  List<Missao> missoes = [];

  Future<void> carregar() async {
    missoes = await servico.buscarTodas();
    notifyListeners();
  }

  int pegarPontos(String dificuldade) {
    if (dificuldade == 'Fácil') {
      return 10;
    } else if (dificuldade == 'Médio') {
      return 20;
    } else {
      return 30;
    }
  }

  Future<void> cadastrar(String titulo, String dificuldade) async {
    final hoje = DateTime.now();
    final dia = hoje.day.toString().padLeft(2, '0');
    final mes = hoje.month.toString().padLeft(2, '0');

    final missao = Missao(
      titulo: titulo,
      dificuldade: dificuldade,
      pontos: pegarPontos(dificuldade),
      data: '$dia/$mes/${hoje.year}',
    );
    await servico.adicionar(missao);
    await carregar();
  }

  Future<void> concluir(Missao missao) async {
    missao.concluida = true;
    await servico.atualizar(missao);
    await carregar();
  }

  Future<void> excluir(Missao missao) async {
    await servico.excluir(missao);
    await carregar();
  }

  int pontosTotal() {
    int total = 0;
    for (final m in missoes) {
      if (m.concluida) {
        total = total + m.pontos;
      }
    }
    return total;
  }
}
