import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_state.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/routes/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;

    return BlocListener<PokemonBloc, PokemonState>(
      listener: (
        context,
        state,
      ) {
        if (state is DataSuccess) {
          unawaited(context.router.push(const HomeRoute()));
        }
         (state is DataError)
             ? SnackBar(
           content: AutoSizeText(
             state.error.toString(),
             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
               color: Theme.of(context).primaryColor,
               fontWeight: FontWeight.w500,
             ),
           ),
           duration: Duration(seconds: AppDimes().size10.round()),
         )
             : null;

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
                      style: theme.displayMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: l10n.book,
                          style: theme.displayMedium
                              ?.copyWith(color: AppColors.kPinkColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimes().size8),
                  child: AutoSizeText(
                    l10n.loading,
                    style: theme.bodySmall,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset(Assets.logo1)],
            ),
          ],
        ),
      ),
    );
  }
}
