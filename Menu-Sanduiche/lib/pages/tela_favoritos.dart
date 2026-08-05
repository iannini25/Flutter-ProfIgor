import 'package:flutter/material.dart';
import '../widgets/card_favorito.dart';

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Seus jogos favoritos:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const CardFavorito(
                icone: Icons.castle,
                nome: 'Reino Perdido',
                categoria: 'Aventura',
              ),

              const SizedBox(height: 12),

              const CardFavorito(
                icone: Icons.sports_soccer,
                nome: 'Copa Total',
                categoria: 'Esporte',
              ),

              const SizedBox(height: 12),

              const CardFavorito(
                icone: Icons.rocket_launch,
                nome: 'Espaço Infinito',
                categoria: 'Ficção',
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
