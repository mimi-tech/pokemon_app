import "package:dio/dio.dart";
import "package:fpdart/fpdart.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/splash_screen/model/pokemon_model.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/utils/api_url.dart";

class SplashScreenRepository {
  const SplashScreenRepository();

  TaskEither<ApiException, List<PokemonModel>> get fetchPokemon {
    return TaskEither.tryCatch(
      () async {
        final dio = Dio();
        final response = await dio.get<Map<String, dynamic>>(
          ApiUrl.baseurl,
          options: Options(headers: {"Content-Type": "application/json"}),
        );
        if (response.statusCode == AppDimes().size200) {
          final jsonDecoded = response.data;
          final responseData = jsonDecoded?["results"] as List;

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
