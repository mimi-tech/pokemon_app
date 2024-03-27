import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_state.dart';
import 'package:phundit_app/commons/color.dart';
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
    return BlocListener<DataBloc, DataState>(
      listener: (context, state) {
        if (state is DataSuccess) {
          // Navigate to home screen on success
          context.router.replace(const HomeRoute());
        //context.router.popUntil((route) => route.settings.name == 'HomeRoute');
        }
        if (state is DataError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: AutoSizeText(state.error.toString(), style: Theme.of(context)
                .textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor)),
            duration: const Duration(seconds: 10),
          ),);
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
        Column(
        mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children:  <Widget>[
      
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child:  RichText(
                text: TextSpan(
                  text: l10n.poke,
                  style: theme.displayMedium,
                  children:  <TextSpan>[
                    TextSpan(
                        text: l10n.book, style: theme.displayMedium!
                        .copyWith(color: kPinkColor),
                    ),
                  ],
                ),
              ),),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AutoSizeText(l10n.loading, style:theme.bodySmall),
            )
      
          ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(Assets.logo1)
            ],
          ),
      ],),
      ),
    );
  }
}
