import "package:flutter_test/flutter_test.dart";
import "package:phundit_app/app/app.dart";
import "package:phundit_app/counter/counter.dart";

void main() {
  const rendersCounterPage = "renders CounterPage";
  const app = "App";
  group(app, () {
    testWidgets(rendersCounterPage, (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
