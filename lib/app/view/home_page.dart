import "dart:async";

import "package:auto_route/auto_route.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:phundit_app/app/bloc/pokemon/pokemon_bloc.dart";
import "package:phundit_app/app/bloc/pokemon/pokemon_state.dart";
import "package:phundit_app/commons/app_dimes.dart";
import "package:phundit_app/commons/app_strings.dart";
import "package:phundit_app/gen/assets.gen.dart";
import "package:phundit_app/l10n/l10n.dart";
import "package:phundit_app/routes/app_router.gr.dart";

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final appTheme = Theme.of(context);
    final dataState = context.watch<PokemonBloc>().state;
    const radius = 60.0;
    const textFildwidth = 6.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStrings.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimes().kMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dataState is DataSuccess)
                Column(
                  children: [
                    SvgPicture.asset(Assets.logo1),
                    SizedBox(height: AppDimes().size20),
                    Text.rich(
                      TextSpan(
                        text: l10n.poke,
                        style: theme.displayMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: l10n.book,
                            style: theme.displayMedium?.copyWith(
                              color: appTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimes().size5),
                    AutoSizeText(
                      l10n.largestPokemon,
                      style: theme.bodyMedium,
                    ),
                    SizedBox(height: AppDimes().size100),
                    TextFormField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: l10n.enterPokemonName,
                        contentPadding: EdgeInsets.all(AppDimes().size20),
                        suffixIcon: Container(
                          padding: EdgeInsets.only(right: AppDimes().size18),
                          decoration: BoxDecoration(
                            color: appTheme.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppDimes().size14),
                            child: SvgPicture.asset(Assets.search),
                          ),
                        ),
                        fillColor: appTheme.primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.primaryColor,
                            width: textFildwidth,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(radius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.primaryColor,
                            width: AppDimes().size07,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(radius)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.primaryColor,
                            width: AppDimes().size005,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(radius)),
                        ),
                      ),
                      style: theme.bodyMedium,
                      cursorColor: appTheme.primaryColor,
                    ),
                    SizedBox(height: AppDimes().size10),
                    GestureDetector(
                      onTap: () =>
                          unawaited(context.router.push(const ViewAllRoute())),
                      child: AutoSizeText(
                        l10n.viewAll,
                        style: theme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              if (dataState is DataLoading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                ),
              if (dataState is DataError)
                Expanded(child: Center(child: Text(dataState.error))),
            ],
          ),
        ),
      ),
    );
  }
}
