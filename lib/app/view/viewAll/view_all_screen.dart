import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_event.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_state.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_bloc.dart';
import 'package:phundit_app/app/bloc/pokemon/pokemon_state.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/side_model.dart';
import 'package:phundit_app/app/view/viewAll/widgets/view_all_appbar.dart';
import 'package:phundit_app/app/view/viewAll/widgets/nestedCards.dart';
import 'package:phundit_app/commons/app_colors.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/commons/app_strings.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:collection/collection.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';

@RoutePage()
class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  final _search = TextEditingController();
  final _radius = 60.0;
  final _widthValue = 1.0;

  final _numPages = 30;

  int _currentPage = 0;
  final _endPage = 10;

  String? _filter;

  @override
  void initState() {
    super.initState();
    final dataState = context.read<PokemonBloc>().state;
    // Dispatch the FetchPokemon event to start fetching data.
    if (dataState is DataSuccess) {
      BlocProvider.of<PokemonDetailsBloc>(context).add(FetchPokemon(
        _endPage,
        dataState.data,
        0,
      ));
    }
    _search.addListener(() {
      setState(() {
        _filter = _search.text;
      });
    });
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final dataState = context.watch<PokemonBloc>().state;
    final dimes = AppDimes();

    return Scaffold(
      appBar: const ViewAllAppbar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStrings.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: dimes.kMargin,
            horizontal: dimes.kMargin,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radius.toDouble()),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBorderColor,
                      offset: Offset(
                        0,
                        AppDimes().size4,
                      ),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: l10n.enterPokemonName,
                    contentPadding: EdgeInsets.all(AppDimes().size20),
                    prefixIcon: UnconstrainedBox(
                      child: SvgPicture.asset(
                        Assets.search,
                        colorFilter: const ColorFilter.mode(
                          AppColors.kLightGrayColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.kWhiteColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.kLightGrayColor2,
                        width: _widthValue,
                      ),
                      borderRadius: BorderRadius.circular(_radius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.kLightGrayColor,
                        width: _widthValue,
                      ),
                      borderRadius: BorderRadius.circular(_radius),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.kLightGrayColor3,
                        width: _widthValue,
                      ),
                      borderRadius: BorderRadius.circular(_radius),
                    ),
                  ),
                  style: theme.bodyMedium,
                  cursorColor: AppColors.kLightGrayColor2,
                ),
              ),
              SizedBox(height: AppDimes().size20),
              if (dataState is DataSuccess)
                BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
                  builder: (
                    context,
                    state,
                  ) {
                    if (state is PokemonInitial) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    } else if (state is PokemonLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    } else if (state is PokemonLoaded) {
                      final pokemon = state.pokemon;

                      return Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (
                                  context,
                                  index,
                                ) {
                                  String pokemonName =
                                      pokemon.elementAtOrNull(index)?.name ??
                                          "";

                                  return _filter == null || _filter == ''
                                      ? Column(
                                          children: [
                                            SizedBox(height: AppDimes().size30),
                                            NestedCards(
                                              fetchedPokeMons: pokemon,
                                              index: index,
                                              pokemonData: pokemon
                                                      .elementAtOrNull(index) ??
                                                  Pokemon(),
                                              showType: true,
                                            ),
                                          ],
                                        )
                                      : pokemonName.toLowerCase().contains(
                                                _filter
                                                        ?.toString()
                                                        .toLowerCase() ??
                                                    '',
                                              )
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: AppDimes().size30,
                                                ),
                                                NestedCards(
                                                  fetchedPokeMons: pokemon,
                                                  index: index,
                                                  pokemonData:
                                                      pokemon.elementAtOrNull(
                                                            index,
                                                          ) ??
                                                          Pokemon(),
                                                  showType: true,
                                                ),
                                              ],
                                            )
                                          : Container();
                                },
                                childCount: pokemon.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is PokemonError) {
                      String error = 'Error: ${state.error}';

                      return Center(child: AutoSizeText(error));
                    }

                    return AutoSizeText(l10n.somethingWentWrong);
                  },
                ),
            ],
          ),
        ),
      ),
      drawer: const SideModel(),
      bottomNavigationBar: dataState is DataSuccess
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppStrings.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppDimes().size18),
                child: NumberPaginator(
                  numberPages: _numPages,
                  onPageChange: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                    int b = _currentPage + 1;
                    int negativeNumber =
                        b == 1 || b == 0 ? 0 : b * _endPage - _endPage;
                    context.read<PokemonDetailsBloc>().add(
                          FetchPokemon(
                            b * _endPage,
                            dataState.data,
                            negativeNumber.abs(),
                          ),
                        );
                  },
                  config: NumberPaginatorUIConfig(
                    height: AppDimes().size40,
                    buttonShape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimes().size8),
                    ),
                    buttonUnselectedForegroundColor: AppColors.kBlackColor,
                    buttonSelectedBackgroundColor:
                        Theme.of(context).primaryColor,
                    buttonUnselectedBackgroundColor: AppColors.kBorderColor,
                    buttonTextStyle:
                        theme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    buttonPadding: EdgeInsets.all(AppDimes().size5),
                  ),
                  prevButtonContent: Icon(
                    Icons.arrow_back_ios,
                    size: AppDimes().size14,
                    color: AppColors.kBlackColor,
                  ),
                  nextButtonContent: Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimes().size14,
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
