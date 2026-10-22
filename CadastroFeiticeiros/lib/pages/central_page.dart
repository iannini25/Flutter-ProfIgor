import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CentralPage extends StatefulWidget {
  const CentralPage({super.key});

  @override
  State<CentralPage> createState() => _CentralPageState();
}

class _CentralPageState extends State<CentralPage> {
  final campoTitulo = TextEditingController();
  final campoGrau = TextEditingController();
  final missoes = FirebaseFirestore.instance.collection('missoes');

  void cadastrar() async {
    await missoes.add({
      'titulo': campoTitulo.text,
      'grau': int.parse(campoGrau.text),
      'concluida': false,
      'usuarioId': FirebaseAuth.instance.currentUser!.uid,
    });
    campoTitulo.clear();
    campoGrau.clear();
  }

  void concluir(String id) async {
    await missoes.doc(id).update({'concluida': true});
  }

  void excluir(String id) async {
    await missoes.doc(id).delete();
  }

  void sair() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Central Jujutsu'),
        actions: [
          TextButton(onPressed: sair, child: const Text('Sair')),
        ],
      ),
      body: Column(
        children: [
          if (usuario.photoURL != null) Image.network(usuario.photoURL!, width: 80),
          const Text('Bem-vindo,'),
          Text('${usuario.displayName}'),
          Text('${usuario.email}'),
          const Text('-----------'),
          TextField(
            controller: campoTitulo,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: campoGrau,
            decoration: const InputDecoration(labelText: 'Grau'),
          ),
          ElevatedButton(onPressed: cadastrar, child: const Text('Cadastrar missão')),
          const Text('-----------'),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              // so pega as missoes do usuario logado
              stream: missoes.where('usuarioId', isEqualTo: usuario.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('carregando...');
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final missao = docs[i];

                    return ListTile(
                      title: Text(missao['titulo']),
                      subtitle: Text('Grau: ${missao['grau']} - Concluída: ${missao['concluida']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (missao['concluida'] == false)
                            TextButton(
                              onPressed: () => concluir(missao.id),
                              child: const Text('Concluir'),
                            ),
                          TextButton(
                            onPressed: () => excluir(missao.id),
                            child: const Text('Excluir'),
                          ),
                        ],
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
