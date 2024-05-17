import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/dominant_color.dart";
import "package:mimi_pokemon_app/app/view/viewAll/sideModel/about_pokemon.dart";
import "package:mimi_pokemon_app/app/view/viewAll/sideModel/side_model_bg.dart";
import "package:mimi_pokemon_app/app/view/viewAll/sideModel/similar_pokemon.dart";
import "package:mimi_pokemon_app/app/view/viewAll/sideModel/stats_pokemon.dart";
import "package:mimi_pokemon_app/app/view/viewAll/widgets/pokemon_type_widget.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";

class SideModelWidget extends StatefulWidget {
  const SideModelWidget({
    this.displayImage,
    this.fetchedPokemon,
    super.key,
    this.selectedPokemon,
  });
  final List<Pokemon>? fetchedPokemon;
  final Pokemon? selectedPokemon;
  final String? displayImage;
  @override
  State<SideModelWidget> createState() => _SideModelWidgetState();
}

class _SideModelWidgetState extends State<SideModelWidget> {
  int _selectedIndex = 0;

  void _handleSelectionChange(int newSelection) {
    setState(() {
      _selectedIndex = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final selector = [l10n.about, l10n.stats, l10n.similar];

    final selectorLength = selector.length;

    final dimens = AppDimes();
    final selectedPokemon = widget.selectedPokemon;
    final fetchedPokemon = widget.fetchedPokemon;
    final displayImage = widget.displayImage ?? "";

    return Column(
      children: [
        Stack(
          children: [
            FutureBuilder<List<Color>>(
              future: const DominantColor().getDominantColorFromSvg(
                displayImage,
              ),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return SideModelBG(snapshot: snapshot);
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
                displayImage,
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
                  SizedBox(height: dimens.size10),
                  AutoSizeText(
                    selectedPokemon?.name ?? "",
                    style: theme.displayLarge,
                  ),
                  SizedBox(height: AppDimes().size10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: AppDimes().size15,
                    children: [
                      for (int nums = 0;
                          nums < (selectedPokemon?.types?.length ?? 0);
                          nums += 1)
                        PokemonTypeWidget(
                          title: selectedPokemon?.types
                                  ?.elementAtOrNull(nums)
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
          padding: EdgeInsets.all(dimens.size18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dimens.size60),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGrayColor,
                offset: Offset(0, AppDimes().size4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(dimens.size12),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              // ShrinkWrap: true,.
              itemBuilder: (ctx, nums) {
                final item = selector.elementAtOrNull(nums)?.toString() ?? "";

                return Padding(
                  padding: EdgeInsets.only(
                    left: dimens.size18,
                    right: dimens.size20,
                  ),
                  child: GestureDetector(
                    child: _selectedIndex == nums
                        ? Material(
                            borderRadius: BorderRadius.circular(
                              AppDimes().size60,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: AppDimes().size12,
                                horizontal: AppDimes().size36,
                              ),
                              child: AutoSizeText(
                                item,
                                style: theme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        : AutoSizeText(
                            item,
                            style: theme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                    onTap: () => _handleSelectionChange(nums),
                  ),
                );
              },
              // ShrinkWrap: true,.
              itemCount: selectorLength,
            ),
          ),
        ),
      ],
    );
  }
}
