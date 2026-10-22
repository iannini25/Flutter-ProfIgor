class Filme {
  int? id;
  String titulo;
  bool assistido;

  Filme({
    this.id,
    required this.titulo,
    this.assistido = false,
  });

  Map<String, dynamic> paraMap() {
    return {
      'titulo': titulo,
      'assistido': assistido ? 1 : 0,
    };
  }
}
