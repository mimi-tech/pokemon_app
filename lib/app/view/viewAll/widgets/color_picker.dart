import "package:flutter/material.dart";
import "package:phundit_app/commons/app_colors.dart";
import "package:phundit_app/commons/app_dimes.dart";

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    required this.containerSize,
    required this.onPressed,
    required this.secondContainerSize,
    this.borderColor,
    this.color,
    super.key,
  });

  final VoidCallback onPressed;
  final Color? borderColor;
  final int containerSize;
  final Color? color;
  final int secondContainerSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: borderColor ?? AppColors.kDarkGrayColor,
            width: AppDimes().size093,
          ),
          shape: BoxShape.circle,
        ),
        width: containerSize.toDouble(),
        height: containerSize.toDouble(),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            width: secondContainerSize.toDouble(),
            height: secondContainerSize.toDouble(),
          ),
        ),
      ),
    );
  }
}
