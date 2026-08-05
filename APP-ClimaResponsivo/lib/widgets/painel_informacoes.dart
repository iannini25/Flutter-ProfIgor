import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  const PainelInformacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informações Extras',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('Umidade: 65%'),
          const Text('Vento: 12 km/h'),
          const Text('Sensação térmica: 30°C'),
          const Text('Nascer do sol: 06:10'),
        ],
      ),
    );
  }
}
