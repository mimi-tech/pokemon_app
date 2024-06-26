import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/sideModel/components/about_widget.dart";
import "package:mimi_pokemon_app/sideModel/page/pokemon_details.dart";

class AboutPokemon extends PokemonDetails {
  const AboutPokemon({
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
    final abilities = selectedPokemon?.abilities;

    return Column(
      children: [
        buildDetails(context),
        Column(
          children: [
            const Divider(color: AppColors.grayColor),
            AutoSizeText(l10n.about, style: theme.titleMedium),
            SizedBox(height: AppDimes().size20),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppStrings.rectangleImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppDimes().size8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AboutWidget(
                      header: l10n.height,
                      height: selectedPokemon?.height?.toDouble(),
                    ),
                    const Divider(),
                    AboutWidget(
                      header: l10n.weight,
                      height: selectedPokemon?.weight?.toDouble(),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          l10n.abilities,
                          style: theme.bodyLarge
                              ?.copyWith(fontSize: AppDimes().fontSize16),
                        ),
                        SizedBox(width: AppDimes().size50),
                        SizedBox(
                          height: AppDimes().size100,
                          child: Center(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      size: AppDimes().size8,
                                      color: AppColors.blackColor,
                                    ),
                                    SizedBox(width: AppDimes().size5),
                                    AutoSizeText(
                                      abilities
                                              ?.elementAtOrNull(index)
                                              ?.ability
                                              ?.name
                                              ?.toString() ??
                                          "",
                                      style: theme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemCount: abilities?.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
