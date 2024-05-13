import "package:bloc_test/bloc_test.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:intl/intl.dart";
import "package:mocktail/mocktail.dart";

import "package:phundit_app/counter/counter.dart";
import "package:phundit_app/counter/view/counter_view.dart";

import "package:phundit_app/l10n/l10n.dart";

class _MockCounterCubit extends MockCubit<int> implements CounterCubit {}

extension _PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        home: widget,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

void main() {
  const counterPage = "CounterPage";
  const counterView = "CounterView";
  const rendersCounterView = "renders CounterView";
  const rendersCurrentCount = "renders current count";
  const callsIncrement = "calls increment when increment button is tapped";
  const callsDecrement = "calls decrement when decrement button is tapped";

  group(counterPage, () {
    testWidgets(rendersCounterView, (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group(counterView, () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = _MockCounterCubit();
    });

    testWidgets(rendersCurrentCount, (tester) async {
      const state = 42;
      when(() => counterCubit?.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit!, child: const CounterView()),
      );
      expect(find.text(NumberFormat().format(state)), findsOneWidget);
    });

    testWidgets(callsIncrement, (tester) async {
      when(() => counterCubit?.state).thenReturn(0);
      when(() => counterCubit?.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit!, child: const CounterView()),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterCubit?.increment()).called(1);
    });

    testWidgets(callsDecrement, (tester) async {
      when(() => counterCubit?.state).thenReturn(0);
      when(() => counterCubit?.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit!, child: const CounterView()),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterCubit?.decrement()).called(1);
    });
  });
}
