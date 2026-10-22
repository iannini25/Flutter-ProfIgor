import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/missao.dart';

class MissaoService {
  final colecao = FirebaseFirestore.instance.collection('missoes');

  Future<void> adicionar(Missao missao) async {
    await colecao.add(missao.toMap());
  }

  Future<List<Missao>> buscarTodas() async {
    final resultado = await colecao.get();

    List<Missao> lista = [];
    for (final doc in resultado.docs) {
      lista.add(Missao.fromMap(doc.id, doc.data()));
    }
    return lista;
  }

  Future<void> atualizar(Missao missao) async {
    await colecao.doc(missao.id).update(missao.toMap());
  }

  Future<void> excluir(Missao missao) async {
    await colecao.doc(missao.id).delete();
  }
}
