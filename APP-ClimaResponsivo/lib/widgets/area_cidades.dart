import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import 'cidade_card.dart';

class AreaCidades extends StatelessWidget {
  final List<CidadeClima> cidades;
  final int colunas;

  const AreaCidades({super.key, required this.cidades, required this.colunas});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: cidades.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: colunas,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return CidadeCard(cidade: cidades[i]);
      },
    );
  }
}
