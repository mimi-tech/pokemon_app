import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:phundit_app/logic/pokemon_bloc.dart';
import 'package:phundit_app/logic/pokemon_state.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/routes/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final TextEditingController _search = TextEditingController();
  final double radius = 60.0;
  final double width = 6.0;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final dataState = context.read<DataBloc>().state;
    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/noise_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(dataState is DataSuccess)
                Column(
                  children: [
                    SvgPicture.asset(Assets.logo1),
                    const SizedBox(height: 20,),
                    RichText(
                      text: TextSpan(
                        text: l10n.poke,
                        style: theme.displayMedium,
                        children:  <TextSpan>[
                          TextSpan(
                            text: l10n.book, style: theme.displayMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    AutoSizeText(l10n.largestPokemon, style:theme.bodyMedium),
                    const SizedBox(height: 100,),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: theme.bodyMedium,
                      controller: _search,
                      decoration:  InputDecoration(
                          fillColor: Theme.of(context).primaryColor,
                          hintText: l10n.enterPokemonName,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: width,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(
                            width: width,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(radius),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                            width: width,
                            color:  Theme.of(context).primaryColor,
                          ),

                          borderRadius: BorderRadius.circular(radius),

                        ),
                        contentPadding:  const EdgeInsets.all(20),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Container(
                              //padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SvgPicture.asset(Assets.search),
                              ) ,
                            ),
                          ),
                      ),

                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                        context.router.push( ViewAllRoute());
                      },
                      child: AutoSizeText(l10n.viewAll, style:theme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                      ),),
                    ),

                  ],
                ),
              if(dataState is DataLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if(dataState is DataError)
                Expanded(
                  child: Center(
                    child: Text(dataState.error.toString()),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
