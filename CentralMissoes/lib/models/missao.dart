class Missao {
  String? id;
  String titulo;
  String dificuldade;
  int pontos;
  bool concluida;
  String data;

  Missao({
    this.id,
    required this.titulo,
    required this.dificuldade,
    required this.pontos,
    this.concluida = false,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'dificuldade': dificuldade,
      'pontos': pontos,
      'concluida': concluida,
      'data': data,
    };
  }

  factory Missao.fromMap(String id, Map<String, dynamic> map) {
    return Missao(
      id: id,
      titulo: map['titulo'],
      dificuldade: map['dificuldade'],
      pontos: map['pontos'],
      concluida: map['concluida'],
      data: map['data'] ?? '',
    );
  }

  String estrelas() {
    if (dificuldade == 'Fácil') {
      return '⭐';
    } else if (dificuldade == 'Médio') {
      return '⭐⭐';
    } else {
      return '⭐⭐⭐';
    }
  }
}
