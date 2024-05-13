import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:phundit_app/app/view/viewAll/sideModel/pokemon_details.dart";
import "package:phundit_app/commons/app_colors.dart";
import "package:phundit_app/commons/app_dimes.dart";
import "package:phundit_app/l10n/l10n.dart";

class StatsPokemon extends PokemonDetails {
  const StatsPokemon({
    required super.fetchedPokemon,
    required super.selectedPokemon,
    super.key,
  });

  @override
  Widget buildDetails(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Column(
      children: [
        const Divider(color: AppColors.kGrayColor),
        Center(child: AutoSizeText(l10n.stats, style: theme.titleMedium)),
        SizedBox(height: AppDimes().size02),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.kWhiteColor,
                AppColors.kGradientColor.withOpacity(AppDimes().size02),
              ],
            ),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final stats = selectedPokemon.stats?.elementAtOrNull(index);

              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimes().size8,
                  horizontal: AppDimes().kMargin,
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
                            backgroundColor: AppColors.kProgressColor,
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
                    const Divider(color: AppColors.kGrayColor),
                  ],
                ),
              );
            },
            itemCount: selectedPokemon.stats?.length ?? 0,
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
