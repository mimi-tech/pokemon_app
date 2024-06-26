import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/sideModel/page/pokemon_details.dart";

class StatsPokemon extends PokemonDetails {
  const StatsPokemon({
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
        Column(
          children: [
            const Divider(color: AppColors.grayColor),
            Center(child: AutoSizeText(l10n.stats, style: theme.titleMedium)),
            SizedBox(height: AppDimes().size02),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.whiteColor,
                    AppColors.gradientColor.withOpacity(AppDimes().size02),
                  ],
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final stats = selectedPokemon?.stats?.elementAtOrNull(index);

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimes().size8,
                      horizontal: AppDimes().margin,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              stats?.stat?.name?.toString() ?? "",
                              style: theme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: AppDimes().size102,
                              child: LinearProgressIndicator(
                                value: stats?.base_stat == null
                                    ? 0.0
                                    : (stats?.base_stat?.toDouble() ?? 0) /
                                        AppDimes().size100,
                                backgroundColor: AppColors.progressColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                                minHeight: AppDimes().size9,
                              ),
                            ),
                            SizedBox(width: AppDimes().size20),
                            AutoSizeText(
                              NumberFormat().format(stats?.base_stat),
                              style: theme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const Divider(color: AppColors.grayColor),
                      ],
                    ),
                  );
                },
                itemCount: selectedPokemon?.stats?.length ?? 0,
              ),
            ),
          ],
        ),
        buildDetails(context),
      ],
    );
  }
}
