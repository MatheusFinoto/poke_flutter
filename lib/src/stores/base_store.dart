import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:poke_flutter/src/repositories/pokemon_repository.dart';

import '../models/pokemon_model.dart';
import '../utils/constants.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  PokemonRepository pokemonRepository = PokemonRepository();

  @observable
  HttpStatus getListOfPokemonStatus = HttpStatus.none;

  @observable
  List<Pokemon> listOfPokemons = [];

  @observable
  PokemonModel? pokemonModel;

  @action
  Future<void> getPokemons() async {
    try {
      getListOfPokemonStatus = HttpStatus.loading;

      dynamic data = await pokemonRepository.get();

      if (data.statusCode == 200) {
        print('sucesso');
        pokemonModel = PokemonModel.fromJson(jsonDecode(data.body));
        getListOfPokemonStatus = HttpStatus.success;
      } else {
        getListOfPokemonStatus = HttpStatus.error;
      }
    } catch (e) {
      print(e.toString());
      getListOfPokemonStatus = HttpStatus.fail;
    }
  }
}
