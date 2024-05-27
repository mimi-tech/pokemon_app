import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";

class SideModelRepository {
  const SideModelRepository();

  Future<String> fetchSvgString(String svgUrl) async {
    final response = await http.get(Uri.parse(svgUrl));
    if (response.statusCode == AppDimes().size200) {
      return response.body;
    }
    throw Exception(AppStrings.failedToLoadSVG);
  }
}
