import "dart:convert";

import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/pokemon_exceptions.dart";
import "package:mimi_pokemon_app/view_all/model/pokemon/pokemon.dart";
import "package:multiple_result/multiple_result.dart";

class ViewAllPokemonRepository {
  const ViewAllPokemonRepository();

  Future<Result<Pokemon, ApiException>> fetchPokemonDetails(String url) async {
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

      return const PokemonExceptions().handleHttpError(response);
    } catch (error) {
      return const PokemonExceptions().handleGeneralError(error.toString());
    }
  }
}
