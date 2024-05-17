import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/app/view/viewAll/widgets/color_picker.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/theme/change_theme_color.dart";
import "package:mimi_pokemon_app/theme/theme_bloc.dart";

class ThemeDialogWidget extends StatefulWidget {
  const ThemeDialogWidget({super.key});

  @override
  State<ThemeDialogWidget> createState() => _ThemeDialogWidgetState();
}

class _ThemeDialogWidgetState extends State<ThemeDialogWidget> {
  Color _selectedColor = AppColors.kPinkColor;

  void _handleColorSelection(
    BuildContext context,
    int nums,
    List<Color> themeColor,
  ) {
    _selectedColor = themeColor.elementAtOrNull(nums) ?? Colors.pink;
    context.read<ThemeBloc>().add(ChangeThemeColor(_selectedColor));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final themeColor = [AppColors.kPinkColor, Colors.cyan, Colors.orange];
    final size = MediaQuery.sizeOf(context);
    final dimens = AppDimes();

    return SizedBox(
      height: size.height * AppDimes().size025,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppStrings.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width,
            height: size.height * AppDimes().size005,
            child: Center(
              child: Text(
                l10n.chooseTheme,
                style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(AppStrings.backgroundImage),
                colorFilter: ColorFilter.mode(
                  AppColors.kLightGrayColor,
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppDimes().size20),
                bottomRight: Radius.circular(AppDimes().size30),
              ),
            ),
            width: size.width,
            height: size.height * AppDimes().size02,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int nums = 0; nums < themeColor.length; nums += 1)
                    GestureDetector(
                      child: ColorPicker(
                        borderColor:
                            _selectedColor == themeColor.elementAtOrNull(nums)
                                ? AppColors.kBlackColor
                                : Colors.transparent,
                        color: themeColor.elementAtOrNull(nums),
                        containerHeight: dimens.size50.toInt(),
                        containerWidth: dimens.size55,
                        secondContainerHeight: dimens.size42,
                        secondContainerWidth: dimens.size45,
                      ),
                      onTap: () =>
                          _handleColorSelection(context, nums, themeColor),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
