import "dart:io";
import "package:http/http.dart" as http;
import "package:mimi_pokemon_app/commons/app_strings.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_exception.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/api_status_code.dart";
import "package:multiple_result/multiple_result.dart";

class PokemonExceptions {
  const PokemonExceptions();

  Result<T, ApiException> handleError<T>(Object error) {
    if (error is HttpException) {
      return const Error(ApiException("Internal server error"));
    } else if (error is FormatException) {
      return const Error(ApiException("Invalid format"));
    } else if (error is SocketException) {
      return const Error(ApiException("No internet connection"));
    }

    return Error(ApiException(error.toString()));
  }

  Result<T, ApiException> handleHttpError<T>(http.Response response) {
    switch (response.statusCode) {
      case ApiStatusCode.notFoundCode:
        return const Error(ApiException(AppStrings.notFound));

      case ApiStatusCode.serverErrorCode:
        return const Error(ApiException(AppStrings.internalServerError));

      default:
        return Error(ApiException(response.body));
    }
  }

  Result<T, ApiException> handleGeneralError<T>(Object error) {
    if (error is FormatException) {
      return const Error(ApiException(AppStrings.invalidFormat));
    } else if (error is SocketException) {
      return const Error(ApiException(AppStrings.noInternetConnection));
    }

    return Error(ApiException(error.toString()));
  }
}
