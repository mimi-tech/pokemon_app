import "package:auto_route/auto_route.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/extension.dart";
import "package:mimi_pokemon_app/gen/assets.gen.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/splash_screen/bloc/pokemon_bloc.dart";

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context).add(const LoadData());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;

    return BlocListener<PokemonBloc, PokemonState>(
      listener: (context, state) {
        state.handlePokemonStateError(context);
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimes().size30),
                  child: Text.rich(
                    TextSpan(
                      text: l10n.poke,
                      children: <TextSpan>[
                        TextSpan(
                          text: l10n.book,
                          style: theme.displayMedium
                              ?.copyWith(color: AppColors.pinkColor),
                        ),
                      ],
                      style: theme.displayMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimes().size8),
                  child: AutoSizeText(l10n.loading, style: theme.bodySmall),
                ),
              ],
            ),
            Center(child: SvgPicture.asset(Assets.logo1)),
          ],
        ),
      ),
    );
  }
}
