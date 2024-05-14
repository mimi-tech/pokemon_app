import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_event.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_state.dart';
import 'package:phundit_app/app/view/viewAll/widgets/enum.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/gen/assets.gen.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';

class NestedCard extends StatelessWidget {
  final Pokemon pokemonData;
  final List<Pokemon> fetchedPokemon;
  final bool showType;
  final int index;
  const NestedCard({
    required this.pokemonData,
    required this.fetchedPokemon,
    required this.showType,
     required this.index,

  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return  BlocProvider<CardBloc>(
      create: (context) => CardBloc(),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          var selectedIndex = state is CardShowingButton ? state.selectedIndex : -1;

          return GestureDetector(
            onTap: (){

              if(selectedIndex == index){
                selectedIndex = -1;
                context.read<CardBloc>().add(CardTapped(-1));
              }else{
                context.read<CardBloc>().add(CardTapped(index));

              }
              },

            child: Stack(
              alignment: Alignment.topCenter,
              children: [

                Container(
                  height: showType?400:280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.grey[400] : kWhiteColor,
                      borderRadius: BorderRadius.circular(26)
                  ),
                  child:  selectedIndex == index
                ?Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Center(
                                  child: ElevatedButton(onPressed: () async {

                                    fetchedPokemons = fetchedPokemon;
                                    selectedPokemon = pokemonData;
                                    Scaffold.of(context).openDrawer();

                                  },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),),

                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,),),
                                    child:  AutoSizeText('View',
                                    style: theme.bodyMedium!.copyWith(color: kWhiteColor,fontWeight: FontWeight.bold),
                                    ),),
                                ),
                  ):Container(),
                ),

                const SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Card(
                      color: kCardColor,
                      elevation: 0,

                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.network(
                    pokemonData.sprites != null &&
                        pokemonData.sprites!.other != null &&
                        pokemonData.sprites!.other!.dream_world != null &&
                        pokemonData.sprites!.other!.dream_world!.front_default != null

                        ?pokemonData.sprites!.other!.dream_world!.front_default.toString()
                        : '',
                    height: 200,width: 200,
                  ),
                ),
                //Text(text1),

                if (showType) Positioned(
                    top: 275,
                    right: 0,
                    left: 0,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(pokemonData.name.toString(),style: theme.headlineMedium,),
                         const SizedBox(height: 20,),


                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15,
                          children: [
                            for(int i = 0; i < pokemonData.types!.length; i++)
                              PokemonTypeWidget(title:pokemonData.types![i].type!.name.toString(),)

                          ],
                        )
                      ],
                    )) else Positioned(
                    top: 220,
                    right: 0,
                    left: 0,
                    child: Center(child: AutoSizeText(pokemonData.name.toString(),style: theme.headlineMedium,))),
              ],
            ),
          );
        }
      ),
    );

  }
}

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({required this.title, super.key});
final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return  Material(
      borderRadius:BorderRadius.circular(53),
      color: kDividerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: Text('${getTypeString(title)} $title',
          style: theme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),),
      ),
    );
  }
}



