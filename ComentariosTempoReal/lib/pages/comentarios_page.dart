import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComentariosPage extends StatefulWidget {
  final String publicacaoId;
  final String texto;
  final String nome;

  const ComentariosPage({
    super.key,
    required this.publicacaoId,
    required this.texto,
    required this.nome,
  });

  @override
  State<ComentariosPage> createState() => _ComentariosPageState();
}

class _ComentariosPageState extends State<ComentariosPage> {
  final campoComentario = TextEditingController();
  final comentarios = FirebaseFirestore.instance.collection('comentarios');

  void comentar() async {
    final usuario = FirebaseAuth.instance.currentUser!;

    await comentarios.add({
      'texto': campoComentario.text,
      'nome': usuario.displayName,
      'usuarioId': usuario.uid,
      'publicacaoId': widget.publicacaoId,
      'data': DateTime.now(),
    });
    campoComentario.clear();
  }

  void excluir(String id) async {
    await comentarios.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    final meuUid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(title: const Text('Comentários')),
      body: Column(
        children: [
          Text(widget.nome),
          Text(widget.texto),
          const Text('-----------'),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              // so os comentarios dessa publicacao
              stream: comentarios.where('publicacaoId', isEqualTo: widget.publicacaoId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('carregando...');
                }

                final docs = snapshot.data!.docs;
                docs.sort((a, b) => (a['data'] as Timestamp).compareTo(b['data'] as Timestamp));

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final comentario = docs[i];

                    return ListTile(
                      title: Text(comentario['texto']),
                      subtitle: Text('${comentario['nome']}'),
                      trailing: comentario['usuarioId'] == meuUid
                          ? TextButton(
                              onPressed: () => excluir(comentario.id),
                              child: const Text('Excluir'),
                            )
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          TextField(
            controller: campoComentario,
            decoration: const InputDecoration(labelText: 'Comentário'),
          ),
          ElevatedButton(onPressed: comentar, child: const Text('Enviar')),
        ],
      ),
    );
  }
}
