import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";

class AboutWidget extends StatelessWidget {
  const AboutWidget({this.header, this.height, super.key});
  final double? height;
  final String? header;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          header?.toString() ?? "",
          style: theme.bodyLarge?.copyWith(fontSize: AppDimes().kFontSize16),
        ),
        SizedBox(width: AppDimes().size50),
        AutoSizeText(
          NumberFormat().format(height),
          style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
