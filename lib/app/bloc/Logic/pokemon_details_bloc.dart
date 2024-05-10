import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_event.dart';
import 'package:phundit_app/app/bloc/Logic/pokemon_details_state.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';
import 'package:phundit_app/services/pokemon_service.dart';
import 'package:xml/xml.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonService repository;

  PokemonDetailsBloc(this.repository) : super(const PokemonInitial()) {
    on<FetchPokemon>((
      event,
      emit,
    ) async {
      try {
        emit(const PokemonLoading());

        List<Pokemon> fetchedData = [];
        for (int i = event.start; i < event.end; i += 1) {
          final result = await repository.fetchPokemonDetails(
            event.pokemonData.elementAtOrNull(i)?.url.toString() ?? '',
          );

          result.when(
            (success) {
              fetchedData.add(success);
            },
            (error) {
              emit(PokemonError(error.toString()));
            },
          );
        }

        emit(PokemonLoaded(
          fetchedData,
          Pokemon(),
        ));
      } catch (err) {
        emit(PokemonError(err.toString()));
      }
    });

    on<ItemSelected>((
      event,
      emit,
    ) {
      emit(PokemonLoaded(
        event.fetchedPokemon,
        event.selectedPokemon,
      ));
    });
  }
}

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardTapped>((
      event,
      emit,
    ) async {
      emit(CardShowingButton(event.index));
    });
  }
}

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(const InitialPokemonListState()) {
    on<UpdateTypes>((
      event,
      emit,
    ) {
      final selectedTypes = event.types;
      final pokemonList = event.pokemonList;

      final matchedPokemon = const DominantColor().findMatchingPokemon(
        pokemonList,
        selectedTypes,
      );
      emit(LoadedPokemonListState(
        matchedPokemon,
        selectedTypes,
      ));
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
          final typeName = typeMap.type?.name as String;
          if (pokemon.types?.any((type) => type.type?.name == typeName) ??
              false) {
            matchedPokemon.add(pokemon);
            break;
          }
        }
      }

      return matchedPokemon;
    } catch (err) {
      return [];
    }
  }

  Future<List<Color>> getDominantColorFromSvg(String svgUrl) async {
    final svgString = await const PokeMonServices().fetchSvgString(svgUrl);

    return parseSvgForDominantColors(svgString);
  }

  List<Color> getMostThreeRepeatedColors(List<Color> colors) {
    Map<Color, int> colorCount = {};
    for (Color color in colors) {
      colorCount[color] = (colorCount[color] ?? 0) + 1;
    }

    List<MapEntry<Color, int>> sortedColors = colorCount.entries.toList()
      ..sort((
        a,
        b,
      ) =>
          b.value.compareTo(a.value));

    List<Color> mostRepeatedColors = [];
    for (int i = 0; i < sortedColors.length && i < AppDimes().size3; i += 1) {
      mostRepeatedColors
          .add(sortedColors.elementAtOrNull(i)?.key ?? Colors.pink);
    }

    return mostRepeatedColors;
  }

  List<Color> parseSvgForDominantColors(String svgString) {
    final document = XmlDocument.parse(svgString);

    List<Color> colors = [];
    RegExp colorRegExp = RegExp(r'fill="#([0-9a-fA-F]{6})"');
    Iterable<Match> matches = colorRegExp.allMatches(document.toString());

    for (Match match in matches) {
      String? hexColor = match.group(1);
      if (hexColor != null) {
        int colorValue = int.parse(
          hexColor,
          radix: 16,
        );
        Color color = Color(colorValue + 0xFF000000);
        colors.add(color);
      }
    }

    List<Color> mostRepeatedColors = getMostThreeRepeatedColors(colors);
    int secondRepeatedColor = 2;

    return [
      mostRepeatedColors.elementAtOrNull(1) ?? Colors.pink,
      mostRepeatedColors.elementAtOrNull(secondRepeatedColor) ?? Colors.white,
    ];
  }
}
