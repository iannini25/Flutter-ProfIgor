import 'package:sqflite/sqflite.dart';

Database? _bancoAberto;

Future<Database> get banco async {
  if (_bancoAberto != null) {
    return _bancoAberto!;
  }

  _bancoAberto = await openDatabase(
    'estoque.db',
    version: 1,
    onCreate: (db, versao) async {
      await db.execute(
          'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, senha TEXT)');
      await db.execute(
          'CREATE TABLE produtos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, categoria TEXT, quantidade INTEGER, preco REAL)');
    },
  );

  return _bancoAberto!;
}
