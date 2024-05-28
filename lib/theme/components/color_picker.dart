import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    this.borderColor,
    this.color,
    this.containerHeight,
    this.containerWidth,
    super.key,
    this.secondContainerHeight,
    this.secondContainerWidth,
  }); // Move super constructor call to the end

  final int? containerHeight;
  final int? containerWidth;
  final int? secondContainerHeight;
  final int? secondContainerWidth;
  final Color? borderColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: borderColor ?? AppColors.darkGrayColor,
          width: AppDimes().size093,
        ),
        shape: BoxShape.circle,
      ),
      width: containerWidth?.toDouble(),
      height: containerHeight?.toDouble(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          width: secondContainerWidth?.toDouble(),
          height: secondContainerHeight?.toDouble(),
        ),
      ),
    );
  }
}
