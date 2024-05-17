import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_bloc.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_load_success.dart";
import "package:mimi_pokemon_app/app/view/viewAll/sideModel/side_model_widget.dart";

class SideModel extends StatelessWidget {
  const SideModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state is PokemonLoadSuccess) {
            final selectedPokemon = state.selectedPokemon;
            final fetchedPokemon = state.fetchedPokemon;
            final displayImage =
                selectedPokemon?.sprites?.other?.dream_world?.front_default ??
                    "";

            // Use selectedPokemon and fetchedPokemon as needed
            return SideModelWidget(
              displayImage: displayImage,
              fetchedPokemon: fetchedPokemon,
              selectedPokemon: selectedPokemon,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
