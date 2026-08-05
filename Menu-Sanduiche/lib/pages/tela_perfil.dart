import 'package:flutter/material.dart';
import '../widgets/card_jogo.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
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

              const Text(
                'Jogador: Bernardo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Joga desde 2020 e gosta de jogos de aventura.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              const CardJogo(
                icone: Icons.star,
                titulo: 'Pontuação',
                descricao: '3500 pontos',
              ),

              const SizedBox(height: 12),

              const CardJogo(
                icone: Icons.check_circle,
                titulo: 'Jogos concluídos',
                descricao: '18 jogos',
              ),

              const SizedBox(height: 12),

              const CardJogo(
                icone: Icons.emoji_events,
                titulo: 'Conquistas',
                descricao: '42 conquistas',
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
