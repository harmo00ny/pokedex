import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';

class APIService {
  final String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<Pokemon> getPokemons() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final pokemon = pokemonFromJson(response.body);
      debugPrint(pokemon.toJson().toString());
      return pokemon;
    } else {
      debugPrint("Some error");
      return null;
    }
  }
}
