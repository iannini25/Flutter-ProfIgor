import 'package:sqflite/sqflite.dart';
import '../models/filme.dart';

class FilmeService {
  Database? _banco;

  Future<Database> abrirBanco() async {
    if (_banco != null) {
      return _banco!;
    }

    _banco = await openDatabase(
      'filmes.db',
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(
            'CREATE TABLE filmes(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT NOT NULL, assistido INTEGER NOT NULL)');
      },
    );

    return _banco!;
  }

  // INSERT
  Future<void> inserir(Filme filme) async {
    final db = await abrirBanco();
    await db.insert('filmes', filme.paraMap());
    print('INSERT -> ${filme.titulo}');
  }

  // SELECT
  Future<List<Filme>> listar() async {
    final db = await abrirBanco();
    final lista = await db.query('filmes');
    print('SELECT -> $lista');

    List<Filme> filmes = [];
    for (final item in lista) {
      filmes.add(Filme(
        id: item['id'] as int,
        titulo: item['titulo'] as String,
        assistido: item['assistido'] == 1,
      ));
    }

    return filmes;
  }

  // UPDATE
  Future<void> atualizar(Filme filme) async {
    final db = await abrirBanco();
    await db.update('filmes', filme.paraMap(), where: 'id = ?', whereArgs: [filme.id]);
    print('UPDATE -> ${filme.titulo} assistido: ${filme.assistido}');
  }
}
