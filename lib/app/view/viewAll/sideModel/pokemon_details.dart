import 'package:flutter/material.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';

abstract class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    required this.fetchedPokemon,
    super.key,
    required this.selectedPokemon,
  });
  final Pokemon selectedPokemon;
  final List<Pokemon> fetchedPokemon;

  Widget buildDetails(
    BuildContext context,
  ); // Abstract method for building details.
}
