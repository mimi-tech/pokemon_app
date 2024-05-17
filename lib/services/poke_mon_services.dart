import "dart:convert";
import "dart:io";

import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";
import "package:mimi_pokemon_app/model/pokemon/pokemon.dart";
import "package:mimi_pokemon_app/model/pokemonnModel/pokemon_model.dart";
import "package:mimi_pokemon_app/services/pokemon_service.dart";
import "package:mimi_pokemon_app/services/the_failure.dart";
import "package:multiple_result/multiple_result.dart";

class PokeMonServices implements PokemonService {
  const PokeMonServices();
  @override
  Future<Result<List<PokemonModel>, TheFailure>> fetchPokemon() async {
    try {
      final response = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=1&limit=500"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == AppDimes().size200) {
        final jsonDecoded = json.decode(response.body) as Map<String, dynamic>;
        final responseData = jsonDecoded["results"] as List;
        final data = responseData
            .map(
              (json) => PokemonModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();

        return Success(data);
      }

      return Error(TheFailure(response.body));
    } on HttpException {
      return Error(TheFailure(AppStrings.internalServerError));
    } on FormatException {
      return Error(TheFailure(AppStrings.invalidFormat));
    } on SocketException {
      return Error(TheFailure(AppStrings.noInternetConnection));
    } catch (error) {
      return Error(TheFailure(error.toString()));
    }
  }

  @override
  Future<Result<Pokemon, TheFailure>> fetchPokemonDetails(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == AppDimes().size200) {
        final jsonDecoded = json.decode(response.body);
        final data = Pokemon.fromJson(jsonDecoded as Map<String, dynamic>);

        return Success(data);
      }

      return Error(TheFailure(response.body));
    } on HttpException {
      return Error(TheFailure(AppStrings.internalServerError));
    } on FormatException {
      return Error(TheFailure(AppStrings.invalidFormat));
    } on SocketException {
      return Error(TheFailure(AppStrings.noInternetConnection));
    } catch (error) {
      return Error(TheFailure(error.toString()));
    }
  }

  @override
  Future<String> fetchSvgString(String svgUrl) async {
    final response = await http.get(Uri.parse(svgUrl));
    if (response.statusCode == AppDimes().size200) {
      return response.body;
    }
    throw Exception(AppStrings.failedToLoadSVG);
  }
}
