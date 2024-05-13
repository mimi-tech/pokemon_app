// ignore_for_file: omit_local_variable_types

/*
 When I added an int as an annotation. I was still getting the error
 */

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:phundit_app/app/bloc/Logic/pokemon_details_event.dart";
import "package:phundit_app/app/bloc/Logic/pokemon_details_state.dart";
import "package:phundit_app/commons/app_dimes.dart";
import "package:phundit_app/model/pokemon/pokemon.dart";
import "package:phundit_app/services/pokemon_service.dart";
import "package:xml/xml.dart";

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(this.repository) : super(const PokemonInitial()) {
    on<FetchPokemon>((event, emit) async {
      try {
        emit(const PokemonLoading());

        final fetchedData = <Pokemon>[];

        for (int nums = event.start; nums < event.end; nums += 1) {
          final result = await repository.fetchPokemonDetails(
            event.pokemonData.elementAtOrNull(nums)?.url?.toString() ?? "",
          );

          result.when(fetchedData.add, (error) {
            emit(PokemonError(error.toString()));
          });
        }

        emit(PokemonLoaded(fetchedData, Pokemon()));
      } catch (error) {
        emit(PokemonError(error.toString()));
      }
    });

    on<ItemSelected>((event, emit) {
      emit(PokemonLoaded(event.fetchedPokemon, event.selectedPokemon));
    });
  }
  final PokemonService repository;
}

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardTapped>((event, emit) async {
      emit(CardShowingButton(event.index));
    });
  }
}

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(InitialPokemonListState()) {
    on<UpdateTypes>((event, emit) {
      final selectedTypes = event.types;
      final pokemonList = event.pokemonList;

      final matchedPokemon = const DominantColor().findMatchingPokemon(
        pokemonList,
        selectedTypes,
      );
      emit(LoadedPokemonListState(matchedPokemon, selectedTypes));
    });
  }
}

class DominantColor {
  const DominantColor();
  List<Pokemon> findMatchingPokemon(
    List<Pokemon> pokemonList,
    List<Types> typeList,
  ) {
    try {
      final matchedPokemon = <Pokemon>[];
      for (final pokemon in pokemonList) {
        for (final typeMap in typeList) {
          final typeName = typeMap.type?.name;
          if (pokemon.types?.any((type) => type.type?.name == typeName) ??
              false) {
            matchedPokemon.add(pokemon);
            break;
          }
        }
      }

      return matchedPokemon;
    } catch (error) {
      return [];
    }
  }

  Future<List<Color>> getDominantColorFromSvg(String svgUrl) async {
    final svgString = await const PokeMonServices().fetchSvgString(svgUrl);

    return parseSvgForDominantColors(svgString);
  }

  List<Color> getMostThreeRepeatedColors(List<Color> colors) {
    final colorCount = <Color, int>{};
    int num;
    for (final color in colors) {
      colorCount[color] = (colorCount[color] ?? 0) + 1;
    }

    final sortedColors = colorCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final mostRepeatedColors = <Color>[];
    for (num = 0;
        num < sortedColors.length && num < AppDimes().size3;
        num += 1) {
      mostRepeatedColors
          .add(sortedColors.elementAtOrNull(num)?.key ?? Colors.pink);
    }

    return mostRepeatedColors;
  }

  List<Color> parseSvgForDominantColors(String svgString) {
    final document = XmlDocument.parse(svgString);

    final colors = <Color>[];
    final colorRegExp = RegExp('fill="#([0-9a-fA-F]{6})"');
    final matches = colorRegExp.allMatches(document.toString());

    for (final match in matches) {
      final hexColor = match.group(1);
      if (hexColor != null) {
        final colorValue = int.parse(hexColor, radix: 16);
        final color = Color(colorValue + 0xFF000000);
        colors.add(color);
      }
    }

    final mostRepeatedColors = getMostThreeRepeatedColors(colors);
    const secondRepeatedColor = 2;

    return [
      mostRepeatedColors.elementAtOrNull(1) ?? Colors.pink,
      mostRepeatedColors.elementAtOrNull(secondRepeatedColor) ?? Colors.white,
    ];
  }
}
