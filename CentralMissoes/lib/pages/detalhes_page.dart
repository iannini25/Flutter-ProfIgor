import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/missao_provider.dart';
import '../models/missao.dart';

class DetalhesPage extends StatefulWidget {
  final Missao missao;

  const DetalhesPage({super.key, required this.missao});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    final missao = widget.missao;

    return Scaffold(
      appBar: AppBar(title: const Text('DETALHES DA MISSÃO')),
      body: Column(
        children: [
          const Text('Título:'),
          Text(missao.titulo),
          const Text('Dificuldade:'),
          Text('${missao.estrelas()} ${missao.dificuldade}'),
          const Text('Pontos:'),
          Text('${missao.pontos}'),
          const Text('Status:'),
          Text(missao.concluida ? 'Concluída' : 'Pendente'),
          const Text('Data:'),
          Text(missao.data),
          if (!missao.concluida)
            ElevatedButton(
              onPressed: () async {
                await Provider.of<MissaoProvider>(context, listen: false).concluir(missao);
                setState(() {});
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Missão concluída! Você conquistou ${missao.pontos} pontos.')),
                );
              },
              child: const Text('CONCLUIR MISSÃO'),
            ),
        ],
      ),
    );
  }
}
