import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_event.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_state.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/pokemon_details.dart';

import 'package:phundit_app/app/view/viewAll/widgets/nestedCards.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/l10n/l10n.dart';

class SimilarPokemon extends PokemonDetails {
  const SimilarPokemon({
    required super.fetchedPokemon,
    super.key,
    required super.selectedPokemon,
  });

  @override
  Widget buildDetails(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Column(children: [
      const Divider(color: AppColors.kGrayColor),
      Center(
        child: AutoSizeText(
          l10n.similar,
          style: theme.titleMedium,
        ),
      ),
      SizedBox(height: AppDimes().size20),
      BlocProvider(
        create: (context) => PokemonListBloc()
          ..add(
            UpdateTypes(
              fetchedPokemon,
              selectedPokemon.types ?? [],

            ),
          ),
        child: BlocBuilder<PokemonListBloc, PokemonListState>(
          builder: (
              context,
              state,
              ) {
            return state is LoadedPokemonListState
                ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.kWhiteColor,
                    AppColors.kGradientColor
                        .withOpacity(AppDimes().size02),
                  ],
                ),
              ),
              child: SizedBox(
                height:
                MediaQuery.sizeOf(context).height * AppDimes().size07,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // ShrinkWrap: true,.
                  itemBuilder: (
                      context,
                      index,
                      ) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimes().size20,
                        horizontal: AppDimes().size50,
                      ),
                      child: NestedCards(
                        fetchedPokeMons: state.pokemonList,
                        index: AppDimes().size022,
                        pokemonData: state.pokemonList[index],
                        showType: false,
                      ),
                    );
                  },
                  itemCount: state.pokemonList.length,
                ),
              ),
            )
                : Center(child: Text(l10n.somethingWentWrong));
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildDetails(context);
  }
}
