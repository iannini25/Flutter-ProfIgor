import 'package:flutter/material.dart';

class TelaAstronauta extends StatelessWidget {
  final String nome;
  final String planeta;
  final int energia;
  final String tipo;

  const TelaAstronauta({
    super.key,
    required this.nome,
    required this.planeta,
    required this.energia,
    required this.tipo,
  });

  String pegarSituacao() {
    if (energia >= 70) {
      return 'Missão pronta para iniciar';
    } else if (energia >= 40) {
      return 'Missão precisa de preparação';
    } else {
      return 'Energia insuficiente para a missão';
    }
  }

  IconData pegarIcone() {
    if (tipo == 'Resgate') {
      return Icons.health_and_safety;
    } else if (tipo == 'Pesquisa científica') {
      return Icons.science;
    } else {
      return Icons.travel_explore;
    }
  }

  Color pegarCor() {
    if (tipo == 'Resgate') {
      return Colors.red;
    } else if (tipo == 'Pesquisa científica') {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronauta'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Planeta: $planeta',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Text(
                'Energia: $energia',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    pegarIcone(),
                    size: 30,
                    color: pegarCor(),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      'Tipo: $tipo',
                      style: TextStyle(
                        fontSize: 18,
                        color: pegarCor(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                pegarSituacao(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
