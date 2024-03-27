import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/about_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/similar_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/sideModel/stats_pokemon.dart';
import 'package:phundit_app/app/view/viewAll/widgets/enum.dart';
import 'package:phundit_app/app/view/viewAll/widgets/nestedCards.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';
import 'package:phundit_app/l10n/l10n.dart';

class SideModel extends StatefulWidget {
  const SideModel({super.key});

  @override
  State<SideModel> createState() => _SideModelState();
}

class _SideModelState extends State<SideModel> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    List<String>  selector = [l10n.about, l10n.stats,l10n.similar];
    return  Drawer(
     // backgroundColor: kWhiteColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: [
                  Stack(

                    children: [

                    FutureBuilder<List<Color>>(
                        future: getDominantColorFromSvg( selectedPokemon!.sprites!.other!
                        .dream_world!.front_default.toString()),
                         builder: (context, snapshot) {
                    if (snapshot.hasData) {

                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),

                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: snapshot.data!,
                          ),
                        ),
                      );
                        } else if (snapshot.hasError) {

                          return Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            decoration:   const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),

                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF7FCAD1), Color(0xFF3DA0A9)],
                              ),
                            ),
                          );;
                        }
                        return  Center(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child:  Center(child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,))),
                        );
              },
            ),



                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                        child: Container(
                          //padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: IconButton(onPressed: (){
                            Navigator.pop(context);},
                            icon: const Icon(Icons.arrow_back),),
                        ),
                      ),




                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,

                        child: SvgPicture.network(
                          selectedPokemon!.sprites != null &&
                              selectedPokemon!.sprites!.other != null &&
                              selectedPokemon!.sprites!.other!.dream_world != null &&
                              selectedPokemon!.sprites!.other!.dream_world!.front_default != null

                              ?selectedPokemon!.sprites!.other!.dream_world!.front_default.toString()
                              : '',
                          height: 200,width: 254,
                        ),
                      ),

                    ],
                  ),

               Expanded(
                 child: ListView(
                               children: [


                  Container(

                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        AutoSizeText(selectedPokemon!.name.toString(),style: theme.displayLarge,),
                        const SizedBox(height: 10,),
                        Wrap(
                          alignment: WrapAlignment.center,

                          spacing: 15,
                          children: [
                            for(int i = 0; i < selectedPokemon!.types!.length; i++)
                              PokemonTypeWidget(title:selectedPokemon!.types![i].type!.name.toString(),),

                          ],
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),


                                 if (selectedIndex == 0)
                                   const PokemonAbout(),
                                 if (selectedIndex == 1)
                                   const PokemonStats(),
                                 if (selectedIndex == 2)
                                   const PokemonSimilar(),
                             ],
                           ),
               ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
                          BoxShadow(
                            color: kGrayColor,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],

                      ),
                             child:  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for(int i = 0; i < selector.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0,left: 18),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = i;
                                  });

                                },
                                child: selectedIndex == i
                                    ?Material(
                                  borderRadius: BorderRadius.circular(60),
                                 child:  Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 12),
                                   child: AutoSizeText(selector[i],style: theme.bodyLarge
                                   !.copyWith(fontWeight: FontWeight.w500),),
                                 ),
                                ): AutoSizeText(selector[i],style: theme.bodyLarge
                                !.copyWith(fontWeight: FontWeight.w500),),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  )



    ])
    );

  }
}


