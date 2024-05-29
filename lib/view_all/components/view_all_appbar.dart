import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/gen/assets.gen.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/theme/components/color_picker.dart";
import "package:mimi_pokemon_app/theme/components/theme_dialog.dart";

class ViewAllAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ViewAllAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;
    final dimens = AppDimes();

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SvgPicture.asset(
            Assets.logo1,
            width: AppDimes().size114,
            height: AppDimes().size74,
          ),
          SizedBox(width: AppDimes().size15),
          Text.rich(
            TextSpan(
              text: l10n.poke,
              children: <TextSpan>[
                TextSpan(
                  text: l10n.book,
                  style: theme.headlineSmall?.copyWith(color: primaryColor),
                ),
              ],
              style: theme.headlineSmall,
            ),
          ),
          const Spacer(),
          GestureDetector(
            child: ColorPicker(
              color: primaryColor,
              containerHeight: dimens.size42,
              containerWidth: dimens.size40.toInt(),
              secondContainerHeight: dimens.size32,
              secondContainerWidth: dimens.size30.toInt(),
            ),
            onTap: () => const ThemeDialog().showMyDialog(context),
          ),
        ],
      ),
      toolbarHeight: dimens.size90,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDimes().size100);
}
