import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/about_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/similar_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/stats_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/widgets/enums_holder.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/l10n/l10n.dart';

import '../widgets/pokemon_type_widget.dart';

class SideModel extends StatefulWidget {
  const SideModel({super.key});

  @override
  State<SideModel> createState() => _SideModelState();
}

class _SideModelState extends State<SideModel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    List<String> selector = [
      l10n.about,
      l10n.stats,
      l10n.similar,
    ];
    final selectedPokemon = EnumsHolder.selectedPokemon;
    final fetchedPokemon = EnumsHolder.fetchedPokemon;
    int selectorLength = selector.length;

    return Drawer(
      width: MediaQuery.sizeOf(context).width,
      child: Column(children: [
        Stack(
          children: [
            FutureBuilder<List<Color>>(
              future: const DominantColor().getDominantColorFromSvg(
                selectedPokemon.sprites?.other?.dream_world?.front_default ??
                    '',
              ),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimes().size24),
                        bottomRight: Radius.circular(AppDimes().size25),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: snapshot.data ?? [],
                      ),
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    height:
                        MediaQuery.sizeOf(context).height * AppDimes().size03,
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimes().size24),
                        bottomRight: Radius.circular(AppDimes().size25),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.kGradientColor1,
                          AppColors.kGradientColor2,
                        ],
                      ),
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    height:
                        MediaQuery.sizeOf(context).height * AppDimes().size03,
                  );
                }

                return Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height:
                        MediaQuery.sizeOf(context).height * AppDimes().size03,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                borderRadius: BorderRadius.circular(AppDimes().size5),
              ),
              margin: EdgeInsets.symmetric(
                vertical: AppDimes().size50,
                horizontal: AppDimes().size20,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              left: 0,
              top: AppDimes().size50,
              right: 0,
              child: SvgPicture.network(
                selectedPokemon.sprites?.other?.dream_world?.front_default ??
                    '',
                width: AppDimes().size254,
                height: AppDimes().size200,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: AppDimes().size10),
                  AutoSizeText(
                    selectedPokemon.name ?? "",
                    style: theme.displayLarge,
                  ),
                  SizedBox(height: AppDimes().size10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: AppDimes().size15,
                    children: [
                      for (int i = 0;
                          i < (selectedPokemon.types?.length ?? 0);
                          i += 1)
                        PokemonTypeWidget(
                          title: selectedPokemon.types
                                  ?.elementAtOrNull(i)
                                  ?.type
                                  ?.name ??
                              "",
                        ),
                    ],
                  ),
                  SizedBox(height: AppDimes().size20),
                ],
              ),
              if (_selectedIndex == 0)
                AboutPokemon(
                  fetchedPokemon: fetchedPokemon,
                  selectedPokemon: selectedPokemon,
                ),
              if (_selectedIndex == 1)
                StatsPokemon(
                  fetchedPokemon: fetchedPokemon,
                  selectedPokemon: selectedPokemon,
                ),
              if (_selectedIndex == AppDimes().size2)
                SimilarPokemon(
                  fetchedPokemon: fetchedPokemon,
                  selectedPokemon: selectedPokemon,
                ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppDimes().size18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimes().size60),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGrayColor,
                offset: Offset(
                  0,
                  AppDimes().size4,
                ),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(AppDimes().size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < selectorLength; i += 1)
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppDimes().size18,
                      right: AppDimes().size18,
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _selectedIndex = i;
                      }),
                      child: _selectedIndex == i
                          ? Material(
                              borderRadius:
                                  BorderRadius.circular(AppDimes().size60),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimes().size12,
                                  horizontal: AppDimes().size36,
                                ),
                                child: AutoSizeText(
                                  selector.elementAtOrNull(i)?.toString() ?? '',
                                  style: theme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          : AutoSizeText(
                              selector.elementAtOrNull(i)?.toString() ?? '',
                              style: theme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
