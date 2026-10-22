import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/filme_viewmodel.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final campoFilme = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<FilmeViewModel>(context, listen: false).carregar();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FilmeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Minha Lista de Filmes')),
      body: Column(
        children: [
          TextField(
            controller: campoFilme,
            decoration: const InputDecoration(labelText: 'Digite o nome do filme'),
          ),
          ElevatedButton(
            onPressed: () {
              vm.adicionar(campoFilme.text);
              campoFilme.clear();
            },
            child: const Text('Adicionar'),
          ),
          const Text('--------------------------------'),
          Expanded(
            child: ListView.builder(
              itemCount: vm.filmes.length,
              itemBuilder: (context, i) {
                final filme = vm.filmes[i];

                return ListTile(
                  leading: Text('${filme.id}'),
                  title: Text(
                    filme.titulo,
                    style: TextStyle(
                      decoration: filme.assistido ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: filme.assistido,
                    onChanged: (valor) {
                      vm.mudarAssistido(filme, valor!);
                    },
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
