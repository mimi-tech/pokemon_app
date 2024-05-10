import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/pokemon_details.dart';
import 'package:phundit_app/app/view/viewAll/widgets/about_widget.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/commons/app_strings.dart';
import 'package:phundit_app/l10n/l10n.dart';

class AboutPokemon extends PokemonDetails {
  const AboutPokemon({
    required super.fetchedPokemon,
    super.key,
    required super.selectedPokemon,
  });

  @override
  Widget buildDetails(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final abilities = selectedPokemon.abilities;

    return Column(
      children: [
        const Divider(color: AppColors.kGrayColor),
        AutoSizeText(
          l10n.about,
          style: theme.titleMedium,
        ),
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
                  height: selectedPokemon.height?.toDouble(),
                ),
                const Divider(),
                AboutWidget(
                  header: l10n.weight,
                  height: selectedPokemon.weight?.toDouble(),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      l10n.abilities,
                      style: theme.bodyLarge
                          ?.copyWith(fontSize: AppDimes().kFontSize16),
                    ),
                    SizedBox(width: AppDimes().size50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            abilities != null && i < abilities.length;
                            i += 1)
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: AppDimes().size8,
                                color: AppColors.kBlackColor,
                              ),
                              SizedBox(width: AppDimes().size5),
                              AutoSizeText(
                                abilities
                                        .elementAtOrNull(i)
                                        ?.ability
                                        ?.name
                                        ?.toString() ??
                                    '',
                                style: theme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDetails(context);
  }
}
