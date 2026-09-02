import 'package:flutter/material.dart';

import '../services/voo_service.dart';

class VooProvider extends ChangeNotifier {
  List<dynamic> voos = [];

  bool carregando = false;

  String erro = '';

  Future<void> buscarVoos(
    String aeroporto,
    String tipo,
  ) async {
    carregando = true;
    erro = '';

    notifyListeners();

    try {
      voos = await VooService.buscarVoos(
        aeroporto,
        tipo,
      );
    } catch (e) {
      erro = 'Erro ao buscar voos';
      voos = [];
    }

    carregando = false;

    notifyListeners();
  }
}
