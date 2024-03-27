import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/side_model.dart';
import 'package:phundit_app/app/view/viewAll/widgets/nestedCards.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:phundit_app/logic/pokemon_bloc.dart';
import 'package:phundit_app/logic/pokemon_state.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/presentation/viewAll/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/presentation/viewAll/Logic/pokemon_details_event.dart';
import 'package:phundit_app/presentation/viewAll/Logic/pokemon_details_state.dart';
import 'package:phundit_app/presentation/viewAll/widgets/appbar.dart';


@RoutePage()
class ViewAllScreen extends StatefulWidget {
   const ViewAllScreen({super.key});


  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {

   final TextEditingController _search = TextEditingController();
  final double radius = 60;

  final double width = 1;

   final int _numPages = 30;

   int _currentPage = 0;
  String selectedIndex = '';
  String? filter;

   @override
  void initState() {

    super.initState();
     final dataState = context.read<DataBloc>().state;
     // Dispatch the FetchPokemon event to start fetching data
     if(dataState is DataSuccess) {

       BlocProvider.of<PokemonBloc>(context).add(FetchPokemon(
           0,  10, dataState.data
       ),);
     }
    _search.addListener(() {
      setState(() {
        filter = _search.text;
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
    final dataState = context.read<DataBloc>().state;

    return  Scaffold(
          appBar: const ViewAllAppbar(),
          drawer: const SideModel(),
          bottomNavigationBar:dataState is DataSuccess
      ?Container(

            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/noise_background.png'),
                  fit: BoxFit.cover,),
            ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: NumberPaginator(
                // by default, the paginator shows numbers as center content
                numberPages: _numPages,
                onPageChange: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                  int b = _currentPage + 1;
                  int negativeNumber = b == 1 || b == 0 ?0:b * 10 - 10;
                  context.read<PokemonBloc>().add(FetchPokemon(
                    negativeNumber.abs(), b * 10, dataState.data,),);

                  // BlocProvider.of<PokemonBloc>(context).add(FetchPokemon(
                  //
                  //   negativeNumber.abs(), b * 10, dataState.data,),);

                },
                nextButtonContent: const Icon(Icons.arrow_forward_ios,size: 14,),
                prevButtonContent: const Icon(Icons.arrow_back_ios,size: 14,color: kBlackColor,),

                config: NumberPaginatorUIConfig(
                  height: 40,

                  buttonShape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  buttonUnselectedForegroundColor: kBlackColor,
                  buttonUnselectedBackgroundColor: kBorderColor,
                  buttonSelectedBackgroundColor: Theme.of(context).primaryColor,
                  buttonTextStyle: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                  buttonPadding: const EdgeInsets.all(5),

                ),




              ),
        ),
      ):Container(),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/noise_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:  Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kMargin,vertical: kMargin),
              child: Column(
                children: [
                  Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      boxShadow: const [
                        BoxShadow(
                          color: kBorderColor,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      cursorColor: kLightGrayColor2,
                      style: theme.bodyMedium,
                      controller: _search,
                      decoration:  InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: l10n.enterPokemonName,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: width,
                            color: kLightGrayColor2,
                          ),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(
                            width: width,
                            color: kLightGrayColor2,
                          ),
                          borderRadius: BorderRadius.circular(radius),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                            width: width,
                            color:  kLightGrayColor2,
                          ),

                          borderRadius: BorderRadius.circular(radius),

                        ),
                        contentPadding:  const EdgeInsets.all(20),
                        prefixIcon:UnconstrainedBox(
                          child: SvgPicture.asset(Assets.search,
                          colorFilter: const ColorFilter.mode(
                              kLightGrayColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  if(dataState is DataSuccess)
                        BlocBuilder<PokemonBloc, PokemonState>(
                        builder: (context, state) {
                        if (state is PokemonInitial) {
                        return  Center(child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,),);
                        } else if (state is PokemonLoading) {
                        return  Center(child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,),);
                        } else if (state is PokemonLoaded ) {
                        final pokemon = state.pokemon;
                        return Expanded(
                          child: ListView(
                            children: [
                              ListView.builder(
                              itemCount: pokemon.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return filter == null || filter == ''
                                    ?  Column(
                                  children: [
                                    const SizedBox(height: 30,),
                                    NestedCard(pokemonData: pokemon[index],
                                      fetchedPokemon: pokemon,
                                      showType: true,
                                      index: index,
                                    ),
                                  ],
                                )
                                :pokemon[index].name.toString().toLowerCase()
                                .contains(
                                    filter!.toLowerCase(),)
                                    ? Column(
                                  children: [
                                    const SizedBox(height: 30,),
                                    NestedCard(pokemonData: pokemon[index],
                                        fetchedPokemon: pokemon,
                                        showType: true,
                                        index: index,

                                    ),
                                  ],
                                )
                                    : Container();
                              },),
                            ],
                          ),
                        );


                                              }else if (state is PokemonError) {
                          return Center(
                            child: AutoSizeText('Error: ${state.error}'),
                          );
                        } else {
                          return  AutoSizeText(l10n.somethingWentWrong);
                        }
                                               },

                                               ),


                       ],),
          ),),);


  }
}
