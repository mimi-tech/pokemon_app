import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/view_all/components/pokemon_type_assets.dart";

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final textTitle =
        "${const PokemonTypeAssets().getTypeString(title ?? "")} ${title ?? ""}";

    return Material(
      color: AppColors.kDividerColor,
      borderRadius: BorderRadius.circular(AppDimes().size53),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimes().size8,
          horizontal: AppDimes().size16,
        ),
        child: Text(
          textTitle,
          style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
