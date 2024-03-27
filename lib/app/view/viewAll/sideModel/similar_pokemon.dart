import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_event.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_state.dart';
import 'package:phundit_app/app/view/viewAll/widgets/enum.dart';
import 'package:phundit_app/app/view/viewAll/widgets/nestedCards.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/commons/dimes.dart';

import 'package:phundit_app/l10n/l10n.dart';


class PokemonSimilar extends StatelessWidget {
  const PokemonSimilar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return  Column(
      children: [
        const Divider(color: kGrayColor,),
        Center(child: AutoSizeText(l10n.similar,style: theme.titleMedium,)),
        const SizedBox(height: 20,),

    BlocProvider(
    create: (context) => PokemonListBloc()..add(UpdateTypes(selectedPokemon!.types!,
        fetchedPokemons,),),
    child: BlocBuilder<PokemonListBloc, PokemonListState>(
    builder: (context, state) {
    if (state is LoadedPokemonListState ) {
      return Container(
      decoration:  BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kWhiteColor, kGradientColor.withOpacity(0.2),kWhiteColor],
    ),
    ),

    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: state.pokemonList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
            child: NestedCard(pokemonData: state.pokemonList[index],
              fetchedPokemon: state.pokemonList,
                showType: false,
                index: -2,
            ),
          );
      }
      ),
    ),);
    }else{
      return Center(child: Text(l10n.somethingWentWrong));
    }
    },)



    ),],
    );
  }
}
