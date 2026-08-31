import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokemon_provider.dart';
import 'tela_detalhes_pokemon.dart';

class TelaPokemon extends StatefulWidget {
  const TelaPokemon({
    super.key,
  });

  @override
  State<TelaPokemon> createState() {
    return _TelaPokemonState();
  }
}

class _TelaPokemonState extends State<TelaPokemon> {
  TextEditingController campoNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PokemonProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokédex',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: campoNome,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonProvider>().buscarPorNome(
                      campoNome.text,
                    );
              },
              child: const Text(
                'Pesquisar',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.read<PokemonProvider>().buscarAleatorio();

                final pokemon = context.read<PokemonProvider>().pokemonAleatorio;

                if (pokemon != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TelaDetalhesPokemon(
                          idPokemon: pokemon['id'],
                        );
                      },
                    ),
                  );
                }
              },
              child: const Text(
                'Pokémon Aleatório',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonProvider>().carregarPokemons();
              },
              child: const Text(
                'Buscar Pokémon',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (provider.pokemonBuscado != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(
                        provider.pokemonBuscado!['imagem'],
                        width: 80,
                      ),
                      Text(
                        provider.pokemonBuscado!['nome']
                            .toString()
                            .toUpperCase(),
                      ),
                      Text(
                        'Id: ${provider.pokemonBuscado!['id']}',
                      ),
                      Text(
                        'Tipo: ${provider.pokemonBuscado!['tipo']}',
                      ),
                      Text(
                        'Altura: ${provider.pokemonBuscado!['altura']}',
                      ),
                      Text(
                        'Peso: ${provider.pokemonBuscado!['peso']}',
                      ),
                    ],
                  ),
                ),
              ),
            if (provider.carregando) const CircularProgressIndicator(),
            if (!provider.carregando)
              Expanded(
                child: ListView.builder(
                  itemCount: provider.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = provider.pokemons[index];

                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          pokemon['imagem'],
                          width: 60,
                        ),
                        title: Text(
                          pokemon['nome'].toString().toUpperCase(),
                        ),
                        subtitle: Text(
                          'Tipo: ${pokemon['tipo']}',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TelaDetalhesPokemon(
                                  idPokemon: pokemon['id'],
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
