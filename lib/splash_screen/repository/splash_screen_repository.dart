// ignore_for_file: prefer-getter-over-method

import "dart:convert";

import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/splash_screen/model/pokemon_model.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/pokemon_exceptions.dart";
import "package:mimi_pokemon_app/utils/api_url.dart";
import "package:multiple_result/multiple_result.dart";

class SplashScreenRepository {
  const SplashScreenRepository();

  Future<Result<List<PokemonModel>, ApiException>> fetchPokemon() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.baseurl),
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

      return const PokemonExceptions().handleHttpError(response);
    } catch (error) {
      return const PokemonExceptions().handleGeneralError(error.toString());
    }
  }
}
