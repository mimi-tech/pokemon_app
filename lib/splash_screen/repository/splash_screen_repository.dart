import "dart:convert";

import "package:fpdart/fpdart.dart";
import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/splash_screen/model/pokemon_model.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/utils/api_url.dart";

class SplashScreenRepository {
  const SplashScreenRepository();

  TaskEither<ApiException, List<PokemonModel>> get fetchPokemon {
    return TaskEither.tryCatch(
      () async {
        final response = await http.get(
          Uri.parse(ApiUrl.baseurl),
          headers: {"Content-Type": "application/json"},
        );
        if (response.statusCode == AppDimes().size200) {
          final jsonDecoded =
              json.decode(response.body) as Map<String, dynamic>;
          final responseData = jsonDecoded["results"] as List;

          return responseData
              .map(
                (json) => PokemonModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        }

        return [];
      },
      (error, _) => ApiException(error.toString()),
    );
  }
}
