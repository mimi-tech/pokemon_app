import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/sideModel/components/side_model_widget.dart";
import "package:mimi_pokemon_app/view_all/bloc/view_all_pokemon_bloc.dart";

class SideModel extends StatelessWidget {
  const SideModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<ViewAllPokemonBloc, ViewAllPokemonState>(
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
