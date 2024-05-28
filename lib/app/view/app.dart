import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/routes/app_router.dart";
import "package:mimi_pokemon_app/splash_screen/bloc/pokemon_bloc.dart";
import "package:mimi_pokemon_app/splash_screen/repository/splash_screen_repository.dart";
import "package:mimi_pokemon_app/theme/app_theme.dart";
import "package:mimi_pokemon_app/theme/bloc/theme_bloc.dart";
import "package:mimi_pokemon_app/view_all/bloc/view_all_pokemon_bloc.dart";
import "package:mimi_pokemon_app/view_all/repository/view_all_pokemon_repository.dart";

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    ThemeData? theme = AppTheme.lightTheme(AppColors.pinkColor);
    const viewAllPokemonRepository = ViewAllPokemonRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc(AppColors.pinkColor)),
        // Moved BlocProviders here.
        BlocProvider<PokemonBloc>(
          create: (context) => PokemonBloc(const SplashScreenRepository())
            ..add(const LoadData()),
        ),
        BlocProvider<ViewAllPokemonBloc>.value(
          value: ViewAllPokemonBloc(viewAllPokemonRepository),
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
