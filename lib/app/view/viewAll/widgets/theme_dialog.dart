import "dart:async";

import "package:flutter/material.dart";

import "package:mimi_pokemon_app/app/view/viewAll/widgets/theme_dialog_widget.dart";

class ThemeDialog {
  const ThemeDialog();

  void showMyDialog(BuildContext context) {
    unawaited(
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (BuildContext ctx, StateSetter setState) {
                return const ThemeDialogWidget();
              },
            ),
            // ContentPadding: EdgeInsets.zero,.
          );
        },
      ),
    );
  }
}
