import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import 'package:phundit_app/counter/counter.dart';
import 'package:phundit_app/counter/view/counter_view.dart';

import '../../helpers/helpers.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  const counterPage = 'CounterPage';
  const counterView = 'CounterView';
  const rendersCounterView = 'renders CounterView';
  const rendersCurrentCount = 'renders current count';
  const callsIncrement = 'calls increment when increment button is tapped';
  const callsDecrement = 'calls decrement when decrement button is tapped';
  group(
    counterPage,
    () {
      testWidgets(
        rendersCounterView,
        (tester) async {
          await tester.pumpApp(const CounterPage());
          expect(
            find.byType(CounterView),
            findsOneWidget,
          );
        },
      );
    },
  );

  group(
    counterView,
    () {
      late CounterCubit counterCubit;

      setUp(() {
        counterCubit = MockCounterCubit();
      });

      testWidgets(
        rendersCurrentCount,
        (tester) async {
          const state = 42;
          when(() => counterCubit.state).thenReturn(state);
          await tester.pumpApp(
            BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          );
          expect(
            find.text(NumberFormat().format(state)),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        callsIncrement,
        (tester) async {
          when(() => counterCubit.state).thenReturn(0);
          when(() => counterCubit.increment()).thenReturn(null);
          await tester.pumpApp(
            BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          );
          await tester.tap(find.byIcon(Icons.add));
          verify(() => counterCubit.increment()).called(1);
        },
      );

      testWidgets(
        callsDecrement,
        (tester) async {
          when(() => counterCubit.state).thenReturn(0);
          when(() => counterCubit.decrement()).thenReturn(null);
          await tester.pumpApp(
            BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          );
          await tester.tap(find.byIcon(Icons.remove));
          verify(() => counterCubit.decrement()).called(1);
        },
      );
    },
  );
}
