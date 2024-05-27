import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";
import "package:mimi_pokemon_app/view_all/bloc/view_all_pokemon_bloc.dart";
import "package:mimi_pokemon_app/view_all/components/pokemon_type_widget.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";

class NestedCardWidget extends StatelessWidget {
  const NestedCardWidget({
    this.fetchedPokeMons,
    this.index,
    super.key,
    this.pokemonData,
    this.selectedIndex,
    this.showType,
  });
  final Pokemon? pokemonData;
  final List<Pokemon>? fetchedPokeMons;
  final bool? showType;
  final int? index;
  final int? selectedIndex;

  void _handleTap(BuildContext context) {
    if (selectedIndex == index) {
      // selectedIndex = -1;
      context.read<ViewAllPokemonBloc>().add(const CardTapped(index: -1));
    } else {
      context.read<ViewAllPokemonBloc>().add(CardTapped(index: index ?? 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final appDimes = AppDimes();
    final pokemonTitle = pokemonData?.name?.toString() ?? "";
    final changeShowType = showType ?? false;

    return GestureDetector(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Colors.grey.withOpacity(AppDimes().size02)
                  : AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(AppDimes().size26),
            ),
            width: double.infinity,
            height: changeShowType ? AppDimes().size400 : AppDimes().size280,
            child: selectedIndex == index
                ? Padding(
                    padding: EdgeInsets.only(top: AppDimes().size90),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          //final bloc = context.read<PokemonDetailsBloc>();

                          context.read<ViewAllPokemonBloc>()
                            ..add(
                              SetFetchedPokemon(
                                fetchedPokemon: fetchedPokeMons ?? [],
                              ),
                            )
                            ..add(
                              SetSelectedPokemon(
                                selectedPokemon: pokemonData ?? Pokemon(),
                              ),
                            );

                          Scaffold.of(context).openDrawer();
                        },
                        child: AutoSizeText(
                          AppStrings.views,
                          style: theme.bodyMedium?.copyWith(
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          SizedBox(
            width: double.infinity,
            height: appDimes.size220,
            child: Padding(
              padding: EdgeInsets.all(AppDimes().size14),
              child: const Card(color: AppColors.kCardColor, elevation: 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: AppDimes().size10),
            child: SvgPicture.network(
              pokemonData?.sprites?.other?.dream_world?.front_default
                      ?.toString() ??
                  "",
              width: appDimes.size200,
              height: appDimes.size220,
            ),
          ),
          if (changeShowType)
            Positioned(
              left: 0,
              top: AppDimes().size280,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(pokemonTitle, style: theme.headlineMedium),
                  SizedBox(height: AppDimes().size20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: AppDimes().size15,
                    children: [
                      for (int nums = 0;
                          nums < (pokemonData?.types?.length ?? 0);
                          nums += 1)
                        PokemonTypeWidget(
                          title: pokemonData?.types
                                  ?.elementAtOrNull(nums)
                                  ?.type
                                  ?.name ??
                              "",
                        ),
                    ],
                  ),
                ],
              ),
            )
          else
            Positioned(
              left: 0,
              top: AppDimes().size220,
              right: 0,
              child: Center(
                child: AutoSizeText(
                  pokemonTitle,
                  style: theme.headlineMedium,
                ),
              ),
            ),
        ],
      ),
      onTap: () => _handleTap(context),
    );
  }
}
