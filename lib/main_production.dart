import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:mimi_pokemon_app/app/app.dart";
import "package:mimi_pokemon_app/bootstrap.dart";
import "package:path_provider/path_provider.dart";

void main() async {
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;
  await bootstrap(() => const App());
}
