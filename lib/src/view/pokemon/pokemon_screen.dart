import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_flutter/src/stores/pokemons_store.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../models/pokemon_model.dart';
import '../../utils/constants.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen(
      {Key? key, required this.pokemonModel, required this.initialPage})
      : super(key: key);

  final PokemonModel pokemonModel;
  final int initialPage;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  // PageController? pageController;
  PokemonsStore pokemonStore = PokemonsStore();

  @override
  void initState() {
    super.initState();
    pokemonStore.setInitialPage(widget.initialPage);
    pokemonStore.setPokemonModel(widget.pokemonModel);
    pokemonStore.getPokeData(pokeID: (widget.initialPage + 1).toString());

    pokemonStore.pageController = PageController(
      initialPage: pokemonStore.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: pokemonStore
            .pokemonModel!.pokemon![pokemonStore.initialPage].baseColor!,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: pokemonStore
              .pokemonModel!.pokemon![pokemonStore.initialPage].baseColor!,
        ),
        body: PageView(
          onPageChanged: (int page) {
            pokemonStore.setInitialPage(page);
            pokemonStore.getPokeData(pokeID: (page + 1).toString());
            // pokemonStore
            //     .setSelectedPokemon(pokemonStore.pokemonModel!.pokemon![page]);
          },
          controller: pokemonStore.pageController,
          children: pokemonStore.pokemonModel!.pokemon!
              .map(
                (pokemon) => Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: size.height - 250,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Observer(builder: (_) {
                                  switch (pokemonStore.getPokeDataStatus) {
                                    case HttpStatus.none:
                                      return Container();
                                    case HttpStatus.loading:
                                      return Container();
                                    case HttpStatus.success:
                                      return Column(
                                        children: [
                                          Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 8,
                                            children: pokemon.type!
                                                .map((e) => Chip(
                                                      backgroundColor:
                                                          Pokemon.color(
                                                              type: e),
                                                      label: Text(e,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ))
                                                .toList(),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text('Sobre',
                                                    style: TextStyle(
                                                        color:
                                                            pokemon.baseColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          'assets/balanca.png'),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(pokemon.weight!)
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('Peso',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black45))
                                                ],
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                height: 60,
                                                width: 1,
                                                color: Colors.black45,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          'assets/regua.png'),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(pokemon.height!)
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('Altura',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black45))
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text('Status Básicos',
                                                    style: TextStyle(
                                                        color:
                                                            pokemon.baseColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Column(
                                              children: pokemonStore
                                                  .pokemonDataModel!.stats!
                                                  .map((e) => Text(
                                                        e.stat!.name!.length ==
                                                                2
                                                            ? e.stat!.name!
                                                                .toUpperCase()
                                                            : e.stat!.name!
                                                                .substring(0, 3)
                                                                .toUpperCase(),
                                                        style: TextStyle(
                                                            color: pokemon
                                                                .baseColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ))
                                                  .toList(),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              height: 100,
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            Column(
                                              children: pokemonStore
                                                  .pokemonDataModel!.stats!
                                                  .map((e) => Text(
                                                        e.baseStat!
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: pokemon
                                                                .baseColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ))
                                                  .toList(),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: pokemonStore
                                                    .pokemonDataModel!.stats!
                                                    .map((e) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child:
                                                              LinearPercentIndicator(
                                                            lineHeight: 9,
                                                            animation: true,
                                                            barRadius:
                                                                const Radius
                                                                    .circular(10),
                                                            percent: double.parse(
                                                                ((e.baseStat! /
                                                                            2) *
                                                                        0.01)
                                                                    .toString()),
                                                            progressColor:
                                                                pokemon
                                                                    .baseColor,
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            )
                                          ])
                                        ],
                                      );
                                    case HttpStatus.fail:
                                      return Container();
                                    case HttpStatus.error:
                                      return Container();
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // alignment: Alignment.center,
                      top: 20,
                      width: size.width,
                      child: Hero(
                        tag: pokemon.id!,
                        child: Image.network(
                          pokemon.image,
                          height: 200,
                        ),
                      ),
                    ),
                    // Positioned(
                    //   // alignment: Alignment.center,
                    //   top: 120,
                    //   width: size.width,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       if (pokemonStore.initialPage != 0)
                    //         IconButton(
                    //             splashRadius: 20,
                    //             onPressed: () {
                    //               pokemonStore.pageController!.animateToPage(
                    //                   pokemonStore.initialPage - 1,
                    //                   duration:
                    //                       const Duration(milliseconds: 400),
                    //                   curve: Curves.easeOut);
                    //             },
                    //             icon: const Icon(
                    //               Icons.arrow_back_ios,
                    //               color: Colors.white,
                    //             ))
                    //       else
                    //         Container(),
                    //       if (pokemonStore.initialPage != 150)
                    //         IconButton(
                    //             splashRadius: 20,
                    //             onPressed: () {
                    //               pokemonStore.pageController!.animateToPage(
                    //                   pokemonStore.initialPage + 1,
                    //                   duration:
                    //                       const Duration(milliseconds: 400),
                    //                   curve: Curves.easeIn);
                    //             },
                    //             icon: const Icon(
                    //               Icons.arrow_forward_ios,
                    //               color: Colors.white,
                    //             )),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              pokemon.name!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Text(
                            '#${pokemon.id}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
