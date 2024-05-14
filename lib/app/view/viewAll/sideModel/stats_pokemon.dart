import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:phundit_app/app/view/viewAll/widgets/enum.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/l10n/l10n.dart';
class PokemonStats extends StatelessWidget {
  const PokemonStats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return  Column(
      children: [
        const Divider(color: kGrayColor,),
        Center(child: AutoSizeText(l10n.stats,style: theme.titleMedium,)),
        const SizedBox(height: 20,),

        Container(

          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kWhiteColor, kGradientColor.withOpacity(0.2),kWhiteColor],
            ),
          ),

          child:  Column(
              children: [
                for(var stats in selectedPokemon!.stats!)
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: kMargin),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(stats.stat!.name.toString(),
                              style: theme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),),
                            Spacer(),

                            SizedBox(
                              width: 102,
                              child: LinearProgressIndicator(
                                value: stats.base_stat! / 100,
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                backgroundColor: Color(0xFFCBCBCB),
                                minHeight: 9,
                              ),
                            ),

                            SizedBox(width: 20,),

                            AutoSizeText('${stats.base_stat}',style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w600)),

                          ],
                        ),
                        Divider(color: kGrayColor,)
                      ],
                    ),
                  ),
                //const Divider(),
              ],
            )


        )
      ],
    );
  }
}
