
import 'package:flexible/data/model/pokemon/pokemon_model.dart';
import 'package:flexible/data/service/pokemon_service.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemons"),),
      body: FutureBuilder(
        future: PokemonService().getPokemon(),
        builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Pokemon>? data = (snapshot.data as PokemonModel..pokemon) as List<Pokemon>?;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].name.toString()),
            );
          },);
        }
      },),
    );
  }
}