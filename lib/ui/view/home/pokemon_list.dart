import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/ui/view/details/details.dart';

class PokemonList extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonList({Key key, this.pokemon}) : super(key: key);

  goToDetails(BuildContext context, PokemonElement pokemon) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(poke: pokemon),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: pokemon.pokemon.length,
      itemBuilder: (context, index) {
        final poke = pokemon.pokemon[index];
        final image = poke.img.replaceAll("http", "https");
        return Card(
          elevation: 3.0,
          child: InkWell(
            splashColor: Colors.lightGreen,
            onTap: () {
              goToDetails(context, poke);
            },
            child: Column(children: [
              Expanded(
                child: Hero(
                  tag: poke.id,
                  child: Image.network(image),
                ),
              ),
              Text(
                poke.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        );
      },
    );
  }
}
