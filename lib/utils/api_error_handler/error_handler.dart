import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/bootstrap.dart";

class ErrorHandler {
  static BlocObserver get observer => const Bootstrap();

  static void handleFlutterError(FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  }
}
