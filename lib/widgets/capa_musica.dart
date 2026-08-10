import 'package:flutter/material.dart';

class CapaMusica extends StatelessWidget {
  final IconData icone;
  final Color cor;
  final bool tocando;
  final double tamanho;

  CapaMusica({
    required this.icone,
    required this.cor,
    required this.tocando,
    required this.tamanho,
  });

  @override
  Widget build(BuildContext context) {
    double tamanhoCapa = tamanho;
    if (tocando == false) {
      tamanhoCapa = tamanho - 40;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: tamanhoCapa,
      height: tamanhoCapa,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icone,
        size: 60,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
