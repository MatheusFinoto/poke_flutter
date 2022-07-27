import 'package:flutter/material.dart';

class PokemonModel {
  List<Pokemon>? pokemon;

  PokemonModel({this.pokemon});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }
}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  // int? candyCount;
  // String? egg;
  // double? spawnChance;
  // double? avgSpawns;
  // String? spawnTime;
  // List<double>? multipliers;
  // List<String>? weaknesses;
  // List<NextEvolution>? nextEvolution;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    // this.candyCount,
    // this.egg,
    // this.spawnChance,
    // this.avgSpawns,
    // this.spawnTime,
    // this.multipliers,
    // this.weaknesses,
    // this.nextEvolution
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    // candyCount = json['candy_count'];
    // egg = json['egg'];
    // spawnChance = json['spawn_chance'];
    // avgSpawns = json['avg_spawns'];
    // spawnTime = json['spawn_time'];
    // multipliers = json['multipliers'].cast<double>();
    // weaknesses = json['weaknesses'].cast<String>();
    // if (json['next_evolution'] != null) {
    //   nextEvolution = <NextEvolution>[];
    //   json['next_evolution'].forEach((v) {
    //     nextEvolution!.add(NextEvolution.fromJson(v));
    //   });
    // }
  }

  Color? get baseColor => color(type: type![0]);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  static Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.deepOrange;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }
}
