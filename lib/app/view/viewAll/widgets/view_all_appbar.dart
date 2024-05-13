import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:phundit_app/app/view/viewAll/widgets/color_picker.dart";
import "package:phundit_app/app/view/viewAll/widgets/theme_dialog.dart";
import "package:phundit_app/commons/app_dimes.dart";
import "package:phundit_app/gen/assets.gen.dart";
import "package:phundit_app/l10n/l10n.dart";

class ViewAllAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ViewAllAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;

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
              style: theme.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: l10n.book,
                  style: theme.headlineSmall
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          ColorPicker(
            containerSize: AppDimes().size42,
            onPressed: () {
              ThemeDialog().showMyDialog(context);
            },
            secondContainerSize: AppDimes().size32,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      toolbarHeight: AppDimes().size90,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDimes().size100);
}
