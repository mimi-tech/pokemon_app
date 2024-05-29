import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/view_all/bloc/view_all_pokemon_bloc.dart";
import "package:mimi_pokemon_app/view_all/components/nested_card_widget.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";

class NestedCards extends StatelessWidget {
  const NestedCards({
    this.fetchedPokeMons,
    this.index,
    super.key,
    this.pokemonData,
    this.showType,
  });
  final Pokemon? pokemonData;
  final List<Pokemon>? fetchedPokeMons;
  final bool? showType;
  final int? index;

  @override
  Widget build(BuildContext context) {
    int selectedIndex;

    return BlocBuilder<ViewAllPokemonBloc, ViewAllPokemonState>(
      builder: (context, state) {
        selectedIndex = state is CardShowingButton ? state.selectedIndex : -1;

        return NestedCardWidget(
          fetchedPokeMons: fetchedPokeMons ?? [],
          index: index ?? 0,
          pokemonData: pokemonData ?? Pokemon(),
          selectedIndex: selectedIndex,
          showType: showType ?? false,
        );
      },
    );
  }
}
