import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/app/view/viewAll/widgets/color_picker.dart';
import 'package:phundit_app/app/view/viewAll/widgets/theme_dialog.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:phundit_app/l10n/l10n.dart';
class ViewAllAppbar extends StatelessWidget implements PreferredSizeWidget{
  const ViewAllAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false,
        toolbarHeight: 90,
      title: Row(
        children: [
          SvgPicture.asset(Assets.logo1,height: 74, width: 114,),
          const SizedBox(width: 15,),
          RichText(
            text: TextSpan(
              text: l10n.poke,
              style: theme.headlineSmall,
              children:  <TextSpan>[
                TextSpan(
                  text: l10n.book, style: theme.headlineSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),

          const Spacer(),

          ColorPicker(containerSize:42,secondContainerSize: 32, color:Theme.of(context).primaryColor,onPressed: (){
            showMyDialog(context);
            //ThemeDialog().showThemeDialog(context);
          })

        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
