import 'package:flutter/material.dart';

class CardMissao extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardMissao({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icone,
              size: 40,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(descricao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
