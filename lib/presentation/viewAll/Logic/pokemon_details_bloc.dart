import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';
import 'package:phundit_app/presentation/viewAll/Logic/pokemon_details_event.dart';
import 'package:phundit_app/presentation/viewAll/Logic/pokemon_details_state.dart';
import 'package:phundit_app/services/pokemon_service.dart';
import 'package:xml/xml.dart';
import 'package:collection/collection.dart';
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {


  PokemonBloc() : super(PokemonInitial()) {
    on<FetchPokemon>((event, emit) async {
      try {
        emit(PokemonLoading());

        List<Pokemon> fetchedData = [];

        for (var i = event.start; i < event.end; i++) {
          final result = await PokeMonServices().fetchPokemonDetails(event.pokemonData[i].url.toString());

          result.when(
                (success) {

              final data = Pokemon.fromJson(success as Map<String, dynamic>);
              fetchedData.add(data);
            },
                (error) {
              emit(PokemonError(error.toString()));
            },
          );
        }

        emit(PokemonLoaded(fetchedData,Pokemon()));

      } catch (e) {
        emit(PokemonError(e.toString()));
      }
    });

    on<ItemSelected>((event, emit){


      emit(PokemonLoaded(event.fetchedPokemon,event.selectedPokemon,));

    });
    }

  }




class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardTapped>((event, emit) async {

      emit(CardShowingButton(event.index));
    });
  }

}

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super( InitialPokemonListState()) {


    on<UpdateTypes>((event, emit) {
      final selectedTypes = event.types;
      final pokemonList = event.pokemonList;

      final matchedPokemon = findMatchingPokemon(pokemonList, selectedTypes);
      emit(LoadedPokemonListState(matchedPokemon, selectedTypes));
    });
  }
}

List<Pokemon> findMatchingPokemon(List<Pokemon> pokemonList, List<Types> typeList) {
  try{
  final matchedPokemon = <Pokemon>[];
  for (final pokemon in pokemonList) {
    for (final typeMap in typeList) {
      final typeName = typeMap.type!.name as String;
      if (pokemon.types!.any((type) => type.type!.name == typeName)) {
        matchedPokemon.add(pokemon);
        break; // Early exit once a match is found for the current Pokemon
      }
    }
  }
  return matchedPokemon;
}catch(e){

    return [];
  }
}

Future<List<Color>> getDominantColorFromSvg(String svgUrl) async {

  // Fetch SVG content
  final svgString = await PokeMonServices().fetchSvgString(svgUrl);
  return parseSvgForDominantColors(svgString);
}

List<Color> getMostThreeRepeatedColors(List<Color> colors) {
  Map<Color, int> colorCount = {};
  colors.forEach((color) {
    colorCount[color] = (colorCount[color] ?? 0) + 1;
  });

  List<MapEntry<Color, int>> sortedColors =
  colorCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

  List<Color> mostRepeatedColors = [];
  for (int i = 0; i < sortedColors.length && i < 3; i++) {
    mostRepeatedColors.add(sortedColors[i].key);
  }

  return mostRepeatedColors;
}







List<Color> parseSvgForDominantColors(String svgString) {
  final document = XmlDocument.parse(svgString);

  List<Color> colors = [];
  RegExp colorRegExp = RegExp(r'fill="#([0-9a-fA-F]{6})"');
  Iterable<Match> matches = colorRegExp.allMatches(document.toString());

  for (Match match in matches) {
    String hexColor = match.group(1)!; // Extract hex color code
    int colorValue = int.parse(hexColor, radix: 16); // Parse hex color to integer
    Color color = Color(0xFF000000 + colorValue); // Convert integer to Color object
    colors.add(color);
  }

  List<Color> mostRepeatedColors =  getMostThreeRepeatedColors(colors);
  List<Color> p = [mostRepeatedColors[1] , mostRepeatedColors[2]];
  return p;
}




