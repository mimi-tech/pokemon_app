import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/app/view/viewAll/widgets/color_picker.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/commons/app_strings.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/theme/theme_cubit.dart';

class ThemeDialog {
  Color selectedColor = AppColors.kPinkColor;
  void showMyDialog(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final themeColor = [
      AppColors.kPinkColor,
      Colors.cyan,
      Colors.orange,
    ];

    unawaited(
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (
                BuildContext context,
                StateSetter setState,
              ) {
                return SizedBox(
                  height:
                      MediaQuery.sizeOf(context).height * AppDimes().size025,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppStrings.backgroundImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height *
                            AppDimes().size005,
                        child: Center(
                          child: Text(
                            l10n.chooseTheme,
                            style: theme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
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
                            bottomLeft: Radius.circular(AppDimes().size30),
                            bottomRight: Radius.circular(AppDimes().size30),
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height *
                            AppDimes().size02,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < themeColor.length; i += 1)
                                ColorPicker(
                                  borderColor: selectedColor ==
                                          themeColor.elementAtOrNull(i)
                                      ? AppColors.kBlackColor
                                      : Colors.transparent,
                                  color: themeColor.elementAtOrNull(i),
                                  containerSize: AppDimes().size55,
                                  onPressed: () {
                                    selectedColor =
                                        themeColor.elementAtOrNull(i) ??
                                            Colors.pink;

                                    context
                                        .read<ThemeCubit>()
                                        .changeThemeColor(selectedColor);
                                  },
                                  secondContainerSize: AppDimes().size45,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            contentPadding: EdgeInsets.zero,
          );
        },
      ),
    );
  }
}
