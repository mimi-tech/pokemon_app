import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import 'package:http/http.dart' as http;
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/commons/app_strings.dart';
import 'package:phundit_app/model/pokemon/pokemon.dart';
import 'package:phundit_app/model/pokemonnModel/pokemonModel.dart';
import 'package:phundit_app/services/feedback.dart';

abstract class PokemonService {
  Future<Result<List<PokemonModel>, TheFailure>> fetchPokemon();
  Future<Result<Pokemon, TheFailure>> fetchPokemonDetails(String url);
  Future<String> fetchSvgString(String svgUrl);
}

class PokeMonServices implements PokemonService {
  const PokeMonServices();
  @override
  Future<Result<List<PokemonModel>, TheFailure>> fetchPokemon() async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=1&limit=500'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == AppDimes().size200) {
        final jsonDecoded = json.decode(response.body);
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
    } catch (err) {
      return Error(TheFailure(err.toString()));
    }
  }

  @override
  Future<Result<Pokemon, TheFailure>> fetchPokemonDetails(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
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
    } catch (err) {
      return Error(TheFailure(err.toString()));
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
