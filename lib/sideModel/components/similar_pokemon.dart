import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/sideModel/bloc/side_model_bloc.dart";
import "package:mimi_pokemon_app/sideModel/page/pokemon_details.dart";
import "package:mimi_pokemon_app/view_all/components/nested_cards.dart";

class SimilarPokemon extends PokemonDetails {
  const SimilarPokemon({
    super.fetchedPokemon,
    super.key,
    super.selectedPokemon,
  });

  @override
  Widget buildDetails(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Column(
      children: [
        buildDetails(context),
        Column(
          children: [
            const Divider(color: AppColors.kGrayColor),
            Center(child: AutoSizeText(l10n.similar, style: theme.titleMedium)),
            SizedBox(height: AppDimes().size20),
            BlocProvider(
              create: (context) => SideModelBloc()
                ..add(
                  UpdateTypes(
                    pokemonList: fetchedPokemon ?? [],
                    types: selectedPokemon?.types ?? [],
                  ),
                ),
              child: BlocBuilder<SideModelBloc, SideModelState>(
                builder: (context, state) {
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
                            height: MediaQuery.sizeOf(context).height *
                                AppDimes().size07,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              // ShrinkWrap: true,.
                              itemBuilder: (ctx, index) {
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
          ],
        ),
      ],
    );
  }
}
