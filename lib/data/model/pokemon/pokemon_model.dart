
import 'package:isar/isar.dart';

@collection
class PokemonModel {
  Id id = Isar.autoIncrement;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemon != null) {
      data['pokemon'] = pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  String? candyCount;
  String? egg;
  String? spawnChance;
  String? avgSpawns;
  String? spawnTime;
  List<String>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  List<PrevEvolution>? prevEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'].toString();
    egg = json['egg'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['candy_count'] = candyCount;
    data['egg'] = egg;
    data['spawn_chance'] = spawnChance;
    data['avg_spawns'] = avgSpawns;
    data['spawn_time'] = spawnTime;
    data['multipliers'] = multipliers;
    data['weaknesses'] = weaknesses;
    if (nextEvolution != null) {
      data['next_evolution'] =
          nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (prevEvolution != null) {
      data['prev_evolution'] =
          prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}
