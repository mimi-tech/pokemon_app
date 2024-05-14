import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_event.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/counter/counter.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/routes/app_router.dart';
import 'package:phundit_app/services/pokemon_service.dart';
import 'package:phundit_app/theme/light_theme.dart';
import 'package:phundit_app/theme/theme_cubit.dart';
import 'package:phundit_app/theme/theme_state.dart';

class App extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  final DataBloc dataBloc = DataBloc(PokeMonServices())..add(LoadData());
  ThemeData theme = MyTheme.lightTheme(kPinkColor);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(kPinkColor)),
        BlocProvider<DataBloc>.value(value: dataBloc),
        BlocProvider<PokemonBloc>.value(value: PokemonBloc()),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is CurrentThemeState) {
            theme = MyTheme.lightTheme(state.primaryColor);
          }
          return MaterialApp.router(
            routerConfig: appRouter.config(),
            theme: theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}



/*class App extends StatelessWidget {
  App({super.key});

  ThemeData theme = MyTheme.lightTheme(kPinkColor);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    print("kkkkkkkkk");
    //BlocProvider(create: (context) => ThemeCubit(kPinkColor));
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => ThemeCubit(kPinkColor)),
      BlocProvider<DataBloc>(create: (context) => DataBloc(PokeMonServices())
        ..add(LoadData()),),
          ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        builder: (context, child) {
          return  BlocListener<ThemeCubit, ThemeState>(
                listener: (context, state) async {
                  if (state is CurrentThemeState) {
                    theme = MyTheme.lightTheme(state.primaryColor);
                  }
                },
              child:child,
              );

            },),);


  }
}

*/