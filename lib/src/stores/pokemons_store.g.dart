// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonsStore on _PokemonsStore, Store {
  late final _$pokemonModelAtom =
      Atom(name: '_PokemonsStore.pokemonModel', context: context);

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

  late final _$initialPageAtom =
      Atom(name: '_PokemonsStore.initialPage', context: context);

  @override
  int get initialPage {
    _$initialPageAtom.reportRead();
    return super.initialPage;
  }

  @override
  set initialPage(int value) {
    _$initialPageAtom.reportWrite(value, super.initialPage, () {
      super.initialPage = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: '_PokemonsStore.pageController', context: context);

  @override
  PageController? get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController? value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$getPokeDataStatusAtom =
      Atom(name: '_PokemonsStore.getPokeDataStatus', context: context);

  @override
  HttpStatus get getPokeDataStatus {
    _$getPokeDataStatusAtom.reportRead();
    return super.getPokeDataStatus;
  }

  @override
  set getPokeDataStatus(HttpStatus value) {
    _$getPokeDataStatusAtom.reportWrite(value, super.getPokeDataStatus, () {
      super.getPokeDataStatus = value;
    });
  }

  late final _$pokemonDataModelAtom =
      Atom(name: '_PokemonsStore.pokemonDataModel', context: context);

  @override
  PokemonDataModel? get pokemonDataModel {
    _$pokemonDataModelAtom.reportRead();
    return super.pokemonDataModel;
  }

  @override
  set pokemonDataModel(PokemonDataModel? value) {
    _$pokemonDataModelAtom.reportWrite(value, super.pokemonDataModel, () {
      super.pokemonDataModel = value;
    });
  }

  late final _$getPokeDataAsyncAction =
      AsyncAction('_PokemonsStore.getPokeData', context: context);

  @override
  Future<void> getPokeData({required String pokeID}) {
    return _$getPokeDataAsyncAction
        .run(() => super.getPokeData(pokeID: pokeID));
  }

  late final _$_PokemonsStoreActionController =
      ActionController(name: '_PokemonsStore', context: context);

  @override
  void setPokemonModel(dynamic value) {
    final _$actionInfo = _$_PokemonsStoreActionController.startAction(
        name: '_PokemonsStore.setPokemonModel');
    try {
      return super.setPokemonModel(value);
    } finally {
      _$_PokemonsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialPage(dynamic value) {
    final _$actionInfo = _$_PokemonsStoreActionController.startAction(
        name: '_PokemonsStore.setInitialPage');
    try {
      return super.setInitialPage(value);
    } finally {
      _$_PokemonsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonModel: ${pokemonModel},
initialPage: ${initialPage},
pageController: ${pageController},
getPokeDataStatus: ${getPokeDataStatus},
pokemonDataModel: ${pokemonDataModel}
    ''';
  }
}
