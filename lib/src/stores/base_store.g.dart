// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  late final _$getListOfPokemonStatusAtom =
      Atom(name: '_BaseStore.getListOfPokemonStatus', context: context);

  @override
  HttpStatus get getListOfPokemonStatus {
    _$getListOfPokemonStatusAtom.reportRead();
    return super.getListOfPokemonStatus;
  }

  @override
  set getListOfPokemonStatus(HttpStatus value) {
    _$getListOfPokemonStatusAtom
        .reportWrite(value, super.getListOfPokemonStatus, () {
      super.getListOfPokemonStatus = value;
    });
  }

  late final _$listOfPokemonsAtom =
      Atom(name: '_BaseStore.listOfPokemons', context: context);

  @override
  List<Pokemon> get listOfPokemons {
    _$listOfPokemonsAtom.reportRead();
    return super.listOfPokemons;
  }

  @override
  set listOfPokemons(List<Pokemon> value) {
    _$listOfPokemonsAtom.reportWrite(value, super.listOfPokemons, () {
      super.listOfPokemons = value;
    });
  }

  late final _$pokemonModelAtom =
      Atom(name: '_BaseStore.pokemonModel', context: context);

  @override
  PokemonModel? get pokemonModel {
    _$pokemonModelAtom.reportRead();
    return super.pokemonModel;
  }

  @override
  set pokemonModel(PokemonModel? value) {
    _$pokemonModelAtom.reportWrite(value, super.pokemonModel, () {
      super.pokemonModel = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('_BaseStore.getPokemons', context: context);

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  @override
  String toString() {
    return '''
getListOfPokemonStatus: ${getListOfPokemonStatus},
listOfPokemons: ${listOfPokemons},
pokemonModel: ${pokemonModel}
    ''';
  }
}
