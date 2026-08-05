import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';

class CidadeCard extends StatelessWidget {
  final CidadeClima cidade;

  const CidadeCard({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(cidade.icone, size: 40, color: Colors.blue),
          Text(
            cidade.nome,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            cidade.temperatura,
            style: const TextStyle(fontSize: 20),
          ),
          Text(cidade.condicao),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clima de ${cidade.nome}')),
              );
            },
            child: const Text('Ver detalhes'),
          ),
        ],
      ),
    );
  }
}
