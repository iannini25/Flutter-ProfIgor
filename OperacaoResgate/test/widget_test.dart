import 'package:flutter_test/flutter_test.dart';

import 'package:central_achados/models/ocorrencia.dart';

void main() {
  test('cria ocorrencia', () {
    const o = Ocorrencia(id: '1', titulo: 'Garrafa', local: 'Sala 3',
      descricao: '', autorId: 'abc', autorNome: 'Teste',
      resolvido: false, criadoEm: null);
    expect(o.titulo, 'Garrafa');
    expect(o.resolvido, false);
  });
}
