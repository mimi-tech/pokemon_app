import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart";
import "package:phundit_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:phundit_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:phundit_app/app/view/viewAll/widgets/enums_holder.dart";
import "package:phundit_app/app/view/viewAll/widgets/pokemon_type_widget.dart";
import "package:phundit_app/commons/app_colors.dart";
import "package:phundit_app/commons/app_dimes.dart";
import "package:phundit_app/commons/app_strings.dart";
import "package:phundit_app/model/pokemon/pokemon.dart";

class NestedCards extends StatelessWidget {
  const NestedCards({
    required this.fetchedPokeMons,
    required this.index,
    required this.pokemonData,
    required this.showType,
    super.key,
  });
  final Pokemon pokemonData;
  final List<Pokemon> fetchedPokeMons;
  final bool showType;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    int selectedIndex;

    return BlocProvider<CardBloc>(
      create: (context) => CardBloc(),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          selectedIndex = state is CardShowingButton ? state.selectedIndex : -1;

          return GestureDetector(
            onTap: () {
              if (selectedIndex == index) {
                selectedIndex = -1;
                context.read<CardBloc>().add(const CardTapped(-1));
              } else {
                context.read<CardBloc>().add(CardTapped(index));
              }
            },
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
                  height: showType ? AppDimes().size400 : AppDimes().size280,
                  child: selectedIndex == index
                      ? Padding(
                          padding: EdgeInsets.only(top: AppDimes().size90),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                EnumsHolder.fetchedPokemon = fetchedPokeMons;
                                EnumsHolder.selectedPokemon = pokemonData;
                                Scaffold.of(context).openDrawer();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor,
                                ),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                    vertical: AppDimes().size12,
                                    horizontal: AppDimes().size30,
                                  ),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppDimes().size15,
                                    ),
                                  ),
                                ),
                              ),
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
                  height: AppDimes().size220,
                  child: Padding(
                    padding: EdgeInsets.all(AppDimes().size14),
                    child: const Card(
                      color: AppColors.kCardColor,
                      elevation: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimes().size10),
                  child: SvgPicture.network(
                    pokemonData.sprites?.other?.dream_world?.front_default
                            ?.toString() ??
                        "",
                    width: AppDimes().size200,
                    height: AppDimes().size200,
                  ),
                ),
                if (showType)
                  Positioned(
                    left: 0,
                    top: AppDimes().size280,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          pokemonData.name?.toString() ?? "",
                          style: theme.headlineMedium,
                        ),
                        SizedBox(height: AppDimes().size20),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: AppDimes().size15,
                          children: [
                            for (int nums = 0;
                                nums < (pokemonData.types?.length ?? 0);
                                nums += 1)
                              PokemonTypeWidget(
                                title: pokemonData.types
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
                        pokemonData.name?.toString() ?? "",
                        style: theme.headlineMedium,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
