import "package:flutter/material.dart";
import "package:phundit_app/app/view/viewAll/widgets/enums_holder.dart";
import "package:phundit_app/commons/app_colors.dart";
import "package:phundit_app/commons/app_dimes.dart";

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final textTitle = "${const EnumsHolder().getTypeString(title)} $title";

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
