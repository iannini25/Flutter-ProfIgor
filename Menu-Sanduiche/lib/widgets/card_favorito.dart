import 'package:flutter/material.dart';

class CardFavorito extends StatelessWidget {
  final IconData icone;
  final String nome;
  final String categoria;

  const CardFavorito({
    super.key,
    required this.icone,
    required this.nome,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icone,
              size: 40,
            ),
            title: Text(nome),
            subtitle: Text(categoria),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Detalhes de $nome'),
                ),
              );
            },
            child: const Text('Ver detalhes'),
          ),
        ],
      ),
    );
  }
}
