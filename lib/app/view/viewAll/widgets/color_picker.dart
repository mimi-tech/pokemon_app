import 'package:flutter/material.dart';
import 'package:phundit_app/commons/color.dart';
class ColorPicker extends StatelessWidget {
  const ColorPicker({
    required this.onPressed,
    super.key, this.color,
    this.borderColor, required this.containerSize,
    required this.secondContainerSize,
  });
  final VoidCallback onPressed;
final Color? color;
final Color? borderColor;
final int containerSize;
final int secondContainerSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: containerSize.toDouble(),
        width: containerSize.toDouble(),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor??kDarkGrayColor,width: 0.93),
          shape: BoxShape.circle,
            color: Colors.transparent
        ),
        child: Center(
          child: Container(
            height: secondContainerSize.toDouble(),
            width: secondContainerSize.toDouble(),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
            ),
          )
        ),
      ),
    );
  }
}
