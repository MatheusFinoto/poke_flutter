import 'package:poke_flutter/src/utils/api_base_helper.dart';

class PokemonRepository {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<dynamic> get() async {
    dynamic response = await apiBaseHelper.get(
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json', null);
    return response;
  }

  Future<dynamic> getById({required String pokeID}) async {
    dynamic response = await apiBaseHelper.get(
        '', 'https://pokeapi.co/api/v2/pokemon/$pokeID');
    return response;
  }
}
