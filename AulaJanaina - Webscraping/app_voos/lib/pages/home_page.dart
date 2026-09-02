import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/voo_provider.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController campoAeroporto = TextEditingController(
    text: 'SBGR',
  );

  String tipo = 'chegadas';

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<VooProvider>().buscarVoos(
            campoAeroporto.text,
            tipo,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VooProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voos',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: campoAeroporto,
              decoration: const InputDecoration(
                labelText: 'Aeroporto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: tipo,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'chegadas',
                  child: Text(
                    'chegadas',
                  ),
                ),
                DropdownMenuItem(
                  value: 'partidas',
                  child: Text(
                    'partidas',
                  ),
                ),
                DropdownMenuItem(
                  value: 'todos',
                  child: Text(
                    'todos',
                  ),
                ),
              ],
              onChanged: (valor) {
                setState(() {
                  tipo = valor!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<VooProvider>().buscarVoos(
                      campoAeroporto.text,
                      tipo,
                    );
              },
              child: const Text(
                'Buscar',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (provider.carregando) const CircularProgressIndicator(),
            if (provider.erro != '')
              Text(
                provider.erro,
              ),
            if (!provider.carregando)
              Expanded(
                child: ListView.builder(
                  itemCount: provider.voos.length,
                  itemBuilder: (context, index) {
                    final voo = provider.voos[index];

                    return Card(
                      child: ListTile(
                        title: Text(
                          voo['identificacao'].toString(),
                        ),
                        subtitle: Text(
                          '${voo['categoria']} - ${voo['local']}',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetalhesPage(
                                  voo: voo,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
