import "package:flutter/material.dart";
import "package:mimi_pokemon_app/app/app.dart";
import "package:mimi_pokemon_app/bootstrap.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}
