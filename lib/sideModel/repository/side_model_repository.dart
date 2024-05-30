import "package:dio/dio.dart";
import "package:fpdart/fpdart.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/commons/app_strings.dart";

class SideModelRepository {
  const SideModelRepository();

  TaskEither<String, String> fetchSvgString(String svgUrl) {
    final dio = Dio();

    return TaskEither.tryCatch(
      () async {
        final response = await dio.get<String>(svgUrl);

        return response.statusCode == AppDimes().size200
            ? response.data ?? ""
            : AppStrings.failedToLoadSVG;
      },
      (error, _) => error.toString(),
    );
  }
}
