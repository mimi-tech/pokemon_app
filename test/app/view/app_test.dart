import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:mimi_pokemon_app/app/app.dart";
import "package:mimi_pokemon_app/commons/app_colors.dart";
import "package:mocktail/mocktail.dart";

void main() {
  const rendersCounterPage = "renders CounterPage";
  const app = "App";
  const initialColor = AppColors.kPinkColor;
  final mockStorage = _MockStorage();
  group(app, () {
    setUp(() {
      HydratedBloc.storage = mockStorage;
    });
    testWidgets(rendersCounterPage, (tester) async {
      await tester.pumpWidget(const App());
      final materialApp =
          tester.firstWidget<MaterialApp>(find.byType(MaterialApp));

      expect(materialApp.theme?.primaryColor, equals(initialColor));
    });
  });
}

class _MockStorage extends Mock implements HydratedStorage {}
