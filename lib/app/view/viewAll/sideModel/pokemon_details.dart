import "package:flutter/material.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

abstract class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    this.fetchedPokemon,
    super.key,
    this.selectedPokemon,
  });

  final List<Pokemon>? fetchedPokemon;
  final Pokemon? selectedPokemon;

  Widget buildDetails(
    BuildContext context,
  ); // Abstract method for building details.
}
