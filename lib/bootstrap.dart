import "dart:async";
import "dart:developer";

import "package:flutter/widgets.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:mimi_pokemon_app/utils/api_error_handler/error_handler.dart";
import "package:path_provider/path_provider.dart";

class Bootstrap extends BlocObserver {
  const Bootstrap();

  @override
  void onChange(
    BlocBase<dynamic> bloc,
    Change<dynamic> change,
  ) {
    super.onChange(
      bloc,
      change,
    );
    log("onChange(${bloc.runtimeType}, $change)");
  }

  @override
  void onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    log("onError(${bloc.runtimeType}, $error, $stackTrace)");
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = ErrorHandler.handleFlutterError;

  Bloc.observer = const Bootstrap();

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  return runApp(await builder());
}
