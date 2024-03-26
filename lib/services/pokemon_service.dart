import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import 'package:http/http.dart' as http;
import 'package:phundit_app/services/feedback.dart';

class PokeMonServices{



    Future<Result<dynamic,TheFailure>> fetchPokemon() async {
      try {
        final  response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=1&limit=500'),
            headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {

          final jsonDecoded = json.decode(response.body);
        //final result = PokemonModel.fromJson(jsonDecoded as Map<String, String>);

          return Success(jsonDecoded);
        }else{
          return Error(TheFailure(response.body));
        }
      }on HttpException {
        return Error(TheFailure('Internal server error'));
      } on FormatException {
        return Error(TheFailure('Invalid format'));
      } on SocketException {
        return Error(TheFailure('No internet connection'));
      }catch (e) {
        return Error(TheFailure(e));
      }
    }

    Future<Result<dynamic, TheFailure>> fetchPokemonDetails(String url) async {

      try {

        final  response = await http.get(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {

          final jsonDecoded = json.decode(response.body);
          //final result = PokemonModel.fromJson(jsonDecoded as Map<String, String>);

          return Success(jsonDecoded);
        }else{
          return Error(TheFailure(response.body));
        }
      }on HttpException {
        return Error(TheFailure('Internal server error'));
      } on FormatException {
        return Error(TheFailure('Invalid format'));
      } on SocketException {
        return Error(TheFailure('No internet connection'));
      }catch (e) {

        return Error(TheFailure(e));
      }
    }

    Future<String> fetchSvgString(String svgUrl) async {
      final response = await http.get(Uri.parse(svgUrl));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // Handle error (e.g., throw exception or return null)
        throw Exception('Failed to load SVG from URL');
      }
    }
  }




