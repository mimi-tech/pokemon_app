import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/sideModel/repository/side_model_repository.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/view_all/model/type/types.dart";
import "package:xml/xml.dart";

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
    final svgString = await const SideModelRepository().fetchSvgString(svgUrl);

    return parseSvgForDominantColors(svgString);
  }

  List<Color> getMostThreeRepeatedColors(List<Color> colors) {
    final colorCount = <Color, int>{};
    int num;
    for (final color in colors) {
      colorCount[color] = (colorCount[color] ?? 0) + 1;
    }

    final sortedColors = colorCount.entries.toList(); // Avoid mutable list
    final sortedList =
        (sortedColors..sort((a, b) => b.value.compareTo(a.value)));

    final mostRepeatedColors = <Color>[];
    for (num = 0;
        num < sortedColors.length && num < AppDimes().size3;
        num += 1) {
      mostRepeatedColors
          .add(sortedList.elementAtOrNull(num)?.key ?? Colors.pink);
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
        final colorPicked = Color(colorValue + 0xFF000000);
        colors.add(colorPicked);
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
