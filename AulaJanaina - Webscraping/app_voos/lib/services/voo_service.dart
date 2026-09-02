import 'dart:convert';

import 'package:http/http.dart' as http;

class VooService {
  static const String url = 'http://127.0.0.1:5001/api/voos';

  // busca os voos na api do python
  static Future<List<dynamic>> buscarVoos(
    String aeroporto,
    String tipo,
  ) async {
    final resposta = await http.get(
      Uri.parse(
        '$url?aeroporto=$aeroporto&tipo=$tipo',
      ),
    );

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(
        resposta.body,
      );

      return dados['voos'];
    }

    throw Exception(
      'Erro ao buscar voos',
    );
  }
}
