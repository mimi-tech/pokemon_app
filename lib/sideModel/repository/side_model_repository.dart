import "package:fpdart/fpdart.dart";
import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";

class SideModelRepository {
  const SideModelRepository();

  // Future<TaskEither<String, String>> fetchSvgString(String svgUrl) async {
  //   final response = await http.get(Uri.parse(svgUrl));
  //   if (response.statusCode == AppDimes().size200) {
  //     return TaskEither.right(response.body);
  //   } else {
  //     return TaskEither.left(AppStrings.failedToLoadSVG);
  //   }
  // }

  // Future<TaskEither<String, String>> fetchSvgString(String svgUrl) async {
  //   final response = await http.get(Uri.parse(svgUrl));
  //   if (response.statusCode == AppDimes().size200) {
  //     return TaskEither.right(response.body);
  //   } else {
  //     return TaskEither.left(AppStrings.failedToLoadSVG);
  //   }
  //
  // }

  TaskEither<String, String> fetchSvgString(String svgUrl) {
    return TaskEither.tryCatch(
      () async {
        final response = await http.get(Uri.parse(svgUrl));

        return response.statusCode == AppDimes().size200
            ? response.body
            : AppStrings.failedToLoadSVG;
      },
      (error, _) => error.toString(),
    );
  }
}
