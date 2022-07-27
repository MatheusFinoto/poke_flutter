import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_flutter/src/models/pokemon_data_model.dart';
import 'package:poke_flutter/src/repositories/pokemon_repository.dart';

import '../models/pokemon_model.dart';
import '../utils/constants.dart';

part 'pokemons_store.g.dart';

class PokemonsStore = _PokemonsStore with _$PokemonsStore;

abstract class _PokemonsStore with Store {
  PokemonRepository pokemonRepository = PokemonRepository();

  @observable
  PokemonModel? pokemonModel;

  @action
  void setPokemonModel(value) => pokemonModel = value;

  // @observable
  // Pokemon? pokemon;

  // @action
  // void setSelectedPokemon(value) => pokemon = value;

  @observable
  int initialPage = 0;

  @action
  void setInitialPage(value) => initialPage = value;

  @observable
  PageController? pageController;

  @observable
  HttpStatus getPokeDataStatus = HttpStatus.none;

  @observable
  PokemonDataModel? pokemonDataModel;

  @action
  Future<void> getPokeData({required String pokeID}) async {
    try {
      getPokeDataStatus = HttpStatus.loading;

      var data = await pokemonRepository.getById(pokeID: pokeID);
      print(data.statusCode.toString());

      if (data.statusCode == 200) {
        pokemonDataModel = PokemonDataModel.fromJson(jsonDecode(data.body));
        getPokeDataStatus = HttpStatus.success;
      } else {
        getPokeDataStatus = HttpStatus.error;
      }
    } catch (e) {
      print(e.toString());
      getPokeDataStatus = HttpStatus.fail;
    }
  }
}
