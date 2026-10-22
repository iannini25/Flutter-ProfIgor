import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'perfil_page.dart';
import 'comentarios_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final campoTexto = TextEditingController();
  final publicacoes = FirebaseFirestore.instance.collection('publicacoes');

  void publicar() async {
    final usuario = FirebaseAuth.instance.currentUser!;

    await publicacoes.add({
      'texto': campoTexto.text,
      'nome': usuario.displayName,
      'usuarioId': usuario.uid,
      'data': DateTime.now(),
    });
    campoTexto.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicações'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilPage()),
              );
            },
            child: const Text('Perfil'),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: campoTexto,
            decoration: const InputDecoration(labelText: 'Escreva algo'),
          ),
          ElevatedButton(onPressed: publicar, child: const Text('Publicar')),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: publicacoes.orderBy('data', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('carregando...');
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final pub = docs[i];

                    return ListTile(
                      title: Text(pub['texto']),
                      subtitle: Text('${pub['nome']}'),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComentariosPage(
                                publicacaoId: pub.id,
                                texto: pub['texto'],
                                nome: '${pub['nome']}',
                              ),
                            ),
                          );
                        },
                        child: const Text('Comentários'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
