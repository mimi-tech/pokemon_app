import "package:dio/dio.dart";
import "package:fpdart/fpdart.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";

class ViewAllPokemonRepository {
  const ViewAllPokemonRepository();

  TaskEither<ApiException, Pokemon> fetchPokemonDetails(String url) {
    return TaskEither.tryCatch(
      () async {
        final dio = Dio();

        final response = await dio.get<Map<String, dynamic>>(
          url,
          options: Options(headers: {"Content-Type": "application/json"}),
        );

        if (response.statusCode == AppDimes().size200) {
          final jsonDecoded = response.data;
          final data =
              jsonDecoded == null ? null : Pokemon.fromJson(jsonDecoded);

          return data ?? Pokemon();
        }

        return Pokemon();
      },
      (error, _) => ApiException(error.toString()),
    );
  }
}
