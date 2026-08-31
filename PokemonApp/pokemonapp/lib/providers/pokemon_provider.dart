import 'package:flutter/material.dart';

import '../services/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<dynamic> pokemons = [];

  Map<String, dynamic>? pokemonSelecionado;

  Map<String, dynamic>? pokemonBuscado;

  Map<String, dynamic>? pokemonAleatorio;

  bool carregando = false;

  Future<void> carregarPokemons() async {
    carregando = true;

    notifyListeners();

    pokemons = await PokemonService.buscarPokemons();

    carregando = false;

    notifyListeners();
  }

  Future<void> carregarDetalhes(
    int id,
  ) async {
    carregando = true;

    pokemonSelecionado = null;

    notifyListeners();

    pokemonSelecionado = await PokemonService.buscarDetalhes(
      id,
    );

    carregando = false;

    notifyListeners();
  }

  Future<void> buscarPorNome(
    String nome,
  ) async {
    carregando = true;

    pokemonBuscado = null;

    notifyListeners();

    pokemonBuscado = await PokemonService.buscarPorNome(
      nome,
    );

    carregando = false;

    notifyListeners();
  }

  Future<void> buscarAleatorio() async {
    carregando = true;

    pokemonAleatorio = null;

    notifyListeners();

    pokemonAleatorio = await PokemonService.buscarAleatorio();

    carregando = false;

    notifyListeners();
  }
}
