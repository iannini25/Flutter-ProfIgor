import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';
import 'cadastro_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ÁREA RESTRITA')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('E-mail:'),
            TextField(controller: email),
            const Text('Senha:'),
            TextField(controller: senha, obscureText: true),
            ElevatedButton(
              onPressed: () async {
                final certo = await usuarioProvider.login(email.text, senha.text);
                if (certo) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('E-mail ou senha incorretos.')),
                  );
                }
              },
              child: const Text('ENTRAR'),
            ),
            const Text('Ainda não possui conta?'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
              child: const Text('CRIAR CONTA'),
            ),
          ],
        ),
      ),
    );
  }
}
