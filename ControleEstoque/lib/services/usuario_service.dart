import '../models/usuario.dart';
import 'banco.dart';

class UsuarioService {
  Future<bool> cadastrar(Usuario usuario) async {
    final db = await banco;

    final achou = await db.query('usuarios', where: 'email = ?', whereArgs: [usuario.email]);

    if (achou.isNotEmpty) {
      return false;
    }

    await db.insert('usuarios', usuario.paraMap());
    print('INSERT → Usuário cadastrado: ${usuario.nome}');
    return true;
  }

  Future<Usuario?> login(String email, String senha) async {
    final db = await banco;

    print('SELECT → Procurando usuário: $email');

    final lista = await db.query('usuarios',
        where: 'email = ? and senha = ?', whereArgs: [email, senha]);

    if (lista.isEmpty) {
      print('SELECT → Usuário não encontrado');
      return null;
    }

    final u = lista[0];
    print('SELECT → Usuário encontrado: ${u['nome']}');

    return Usuario(
      id: u['id'] as int,
      nome: u['nome'] as String,
      email: u['email'] as String,
      senha: u['senha'] as String,
    );
  }
}
