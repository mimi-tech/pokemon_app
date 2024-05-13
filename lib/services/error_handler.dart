import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:phundit_app/bootstrap.dart";

class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  }

  static BlocObserver get observer => const Bootstrap();
}
