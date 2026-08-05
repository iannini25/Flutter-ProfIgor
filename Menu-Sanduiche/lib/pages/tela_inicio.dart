import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/card_jogo.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Explorer'),
        centerTitle: true,
      ),

      drawer: const MenuLateral(),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.sports_esports,
                size: 100,
              ),

              SizedBox(height: 16),

              Text(
                'Bem-vindo ao Game Explorer!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Explore jogos, descubra novas aventuras '
                'e organize seus conteúdos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 30),

              CardJogo(
                icone: Icons.explore,
                titulo: 'Explorar',
                descricao:
                    'Descubra novos jogos, mundos e personagens.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.favorite,
                titulo: 'Favoritos',
                descricao:
                    'Organize os jogos que você mais gosta.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.emoji_events,
                titulo: 'Conquistas',
                descricao:
                    'Acompanhe seus desafios e recompensas.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
