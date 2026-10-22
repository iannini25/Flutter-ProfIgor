import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Column(
        children: [
          Text('Nome: ${usuario.displayName}'),
          Text('Email: ${usuario.email}'),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
