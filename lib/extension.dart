import "dart:async";

import "package:auto_route/auto_route.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/routes/app_router.gr.dart";
import "package:mimi_pokemon_app/splash_screen/bloc/pokemon_bloc.dart";

extension Extension on BuildContext {
  void handlePokemonStateError(PokemonState state) {
    const errorText = "An error occurred";
    final theme = Theme.of(this);
    final scaffoldMessenger = ScaffoldMessenger.of(this);

    if (state is DataSuccess) {
      unawaited(router.push(const HomeRoute()));
    }

    (state is DataError)
        ? scaffoldMessenger.showSnackBar(
            SnackBar(
              content: AutoSizeText(
                state.error,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              duration: Duration(seconds: AppDimes().size10.round()),
            ),
          )
        : scaffoldMessenger
            .showSnackBar(const SnackBar(content: Text(errorText)));
  }
}
