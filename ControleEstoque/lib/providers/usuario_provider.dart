import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/usuario_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final servico = UsuarioService();
  Usuario? usuarioLogado;

  Future<bool> cadastrar(String nome, String email, String senha) async {
    final usuario = Usuario(nome: nome, email: email, senha: senha);
    return await servico.cadastrar(usuario);
  }

  Future<bool> login(String email, String senha) async {
    final usuario = await servico.login(email, senha);
    usuarioLogado = usuario;
    notifyListeners();
    return usuario != null;
  }

  void sair() {
    usuarioLogado = null;
    notifyListeners();
  }
}
