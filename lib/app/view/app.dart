// ignore_for_file: avoid-ignoring-return-values

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/pokemon_details_bloc.dart";
import "package:mimi_pokemon_app/app/bloc/pokemon/load_data.dart";
import "package:mimi_pokemon_app/app/bloc/pokemon/pokemon_bloc.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/routes/app_router.dart";
import "package:mimi_pokemon_app/services/poke_mon_services.dart";
import "package:mimi_pokemon_app/theme/app_theme.dart";
import "package:mimi_pokemon_app/theme/current_theme_state.dart";
import "package:mimi_pokemon_app/theme/theme_bloc.dart";
import "package:mimi_pokemon_app/theme/theme_state.dart";

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  final _repository = const PokeMonServices();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = AppTheme.lightTheme(AppColors.kPinkColor);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc(AppColors.kPinkColor)),
        // Moved BlocProviders here.
        BlocProvider<PokemonBloc>(
          create: (context) =>
              PokemonBloc(const PokeMonServices())..add(const LoadData()),
        ),
        BlocProvider<PokemonDetailsBloc>.value(
          value: PokemonDetailsBloc(_repository),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is CurrentThemeState) {
            theme = AppTheme.lightTheme(state.primaryColor);
          }

          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
