import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_flutter/src/components/card_pokemon.dart';
import 'package:poke_flutter/src/stores/base_store.dart';
import 'package:page_transition/page_transition.dart';
import 'package:poke_flutter/src/view/pokemon/pokemon_screen.dart';

import '../../models/pokemon_model.dart';
import '../../utils/constants.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  BaseStore baseStore = BaseStore();

  @override
  void initState() {
    super.initState();
    baseStore.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Pokédex',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            Observer(
              builder: (_) {
                switch (baseStore.getListOfPokemonStatus) {
                  case HttpStatus.none:
                    return Container(
                      color: Colors.blue,
                      height: 200,
                      width: 300,
                    );
                    ;

                  case HttpStatus.loading:
                    return Container(
                      color: Colors.yellow,
                      height: 200,
                      width: 300,
                    );

                  case HttpStatus.success:
                    return Expanded(
                      child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: baseStore.pokemonModel!.pokemon!
                              .map((e) => CardPokemon(
                                    pokemon: e,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: PokemonScreen(
                                                pokemonModel:
                                                    baseStore.pokemonModel!,
                                                initialPage: baseStore
                                                    .pokemonModel!.pokemon!
                                                    .indexOf(e),
                                              )));
                                    },
                                  ))
                              .toList()),
                    );
                  case HttpStatus.error:
                    return Container(
                      color: Colors.orange,
                      height: 200,
                      width: 300,
                    );
                    ;
                  case HttpStatus.fail:
                    return Container(
                      color: Colors.black,
                      height: 200,
                      width: 300,
                    );
                    ;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
