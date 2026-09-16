import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('CADASTRO')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Nome:'),
            TextField(controller: nome),
            const Text('E-mail:'),
            TextField(controller: email),
            const Text('Senha:'),
            TextField(controller: senha, obscureText: true),
            ElevatedButton(
              onPressed: () async {
                final deu = await usuarioProvider.cadastrar(nome.text, email.text, senha.text);
                if (deu) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('E-mail já cadastrado.')),
                  );
                }
              },
              child: const Text('CADASTRAR'),
            ),
          ],
        ),
      ),
    );
  }
}
