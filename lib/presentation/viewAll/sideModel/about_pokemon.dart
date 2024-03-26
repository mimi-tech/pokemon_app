import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/presentation/viewAll/widgets/enum.dart';
import 'package:phundit_app/l10n/l10n.dart';
class PokemonAbout extends StatelessWidget {
  const PokemonAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return  Column(
      children: [
        const Divider(color: kGrayColor,),
        AutoSizeText(l10n.about,style: theme.titleMedium,),
        const SizedBox(height: 20,),

        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rectangle.png'),
                fit: BoxFit.cover,),
            ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AboutWidget(height: selectedPokemon!.height!.toDouble(),header: l10n.height,),
                const Divider(),
                AboutWidget(height: selectedPokemon!.weight!.toDouble(),header: l10n.weight,),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(l10n.abilities,style: theme.bodyLarge!.copyWith(fontSize: kFontSize16),),
                    const SizedBox(width: 50,),

                    Column(
                      children: [
                        for(int i = 0; i < selectedPokemon!.abilities!.length; i++)
                          Row(
                            children: [
                              const Icon(Icons.circle_rounded,size: 8,color: kBlackColor,),
                              const SizedBox(width:5),
                              AutoSizeText(selectedPokemon!.abilities![i].ability!.name.toString(),
                                style: theme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w600),),
                            ],
                          )

                      ],
                    )
                  ],
                )



              ],
            ),
          ),
        )
      ],
    );
  }
}


class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key, this.height, this.header});
  final double? height;
  final String? header;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(header!,style: theme.bodyLarge!.copyWith(fontSize: kFontSize16),),
        const SizedBox(width: 50,),
        AutoSizeText(height!.toString(),
          style: theme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),),
      ],
    );
  }
}

