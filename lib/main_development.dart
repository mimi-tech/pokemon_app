import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:path_provider/path_provider.dart";
import "package:phundit_app/app/app.dart";
import "package:phundit_app/bootstrap.dart";

void main() async {
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;
  await bootstrap(() => const App());
}
