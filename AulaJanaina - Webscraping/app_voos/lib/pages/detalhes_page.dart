import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final dynamic voo;

  const DetalhesPage({
    super.key,
    required this.voo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Identificação: ${voo['identificacao']}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Categoria: ${voo['categoria']}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Aeronave: ${voo['tipo_aeronave']}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Local: ${voo['local']}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Partida: ${voo['partida']}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Chegada: ${voo['chegada']}',
            ),
          ],
        ),
      ),
    );
  }
}
