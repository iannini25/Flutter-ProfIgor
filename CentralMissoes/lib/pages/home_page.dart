import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/missao_provider.dart';
import '../models/missao.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final campoTitulo = TextEditingController();
  String dificuldade = 'Fácil';

  @override
  void initState() {
    super.initState();
    Provider.of<MissaoProvider>(context, listen: false).carregar();
  }

  void concluir(Missao missao) async {
    await Provider.of<MissaoProvider>(context, listen: false).concluir(missao);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Missão concluída! Você conquistou ${missao.pontos} pontos.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MissaoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('CENTRAL DE MISSÕES')),
      body: Column(
        children: [
          TextField(
            controller: campoTitulo,
            decoration: const InputDecoration(labelText: 'Título da missão'),
          ),
          DropdownButton<String>(
            value: dificuldade,
            items: const [
              DropdownMenuItem(value: 'Fácil', child: Text('Fácil')),
              DropdownMenuItem(value: 'Médio', child: Text('Médio')),
              DropdownMenuItem(value: 'Difícil', child: Text('Difícil')),
            ],
            onChanged: (valor) {
              setState(() {
                dificuldade = valor!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              provider.cadastrar(campoTitulo.text, dificuldade);
              campoTitulo.clear();
            },
            child: const Text('CADASTRAR MISSÃO'),
          ),
          Text('PONTOS CONQUISTADOS: ${provider.pontosTotal()}'),
          const Text('------------------------'),
          Expanded(
            child: ListView.builder(
              itemCount: provider.missoes.length,
              itemBuilder: (context, i) {
                final missao = provider.missoes[i];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetalhesPage(missao: missao)),
                    );
                  },
                  child: Column(
                    children: [
                      Text(missao.titulo),
                      Text('Dificuldade: ${missao.estrelas()}'),
                      Text('Pontos: ${missao.pontos}'),
                      Text(missao.concluida ? 'Status: Concluída' : 'Status: Pendente'),
                      Text('Data: ${missao.data}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!missao.concluida)
                            ElevatedButton(
                              onPressed: () {
                                concluir(missao);
                              },
                              child: const Text('CONCLUIR'),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              provider.excluir(missao);
                            },
                            child: const Text('EXCLUIR'),
                          ),
                        ],
                      ),
                      const Text('------------------------'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
