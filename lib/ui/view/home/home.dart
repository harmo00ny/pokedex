import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/service/api.dart';
import 'package:pokedex/ui/view/home/pokemon_list.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final APIService _apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PokeDex App",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
          future: _apiService.getPokemons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Pokemon pokemon = snapshot.data;
              return PokemonList(pokemon: pokemon);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
