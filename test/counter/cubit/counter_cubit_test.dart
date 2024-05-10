import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:phundit_app/counter/counter.dart';

void main() {
  const counterCubit = 'CounterCubit';
  const initialState = 'initial state is 0';
  const emitsWhenIncrementIsCalled = 'emits [1] when increment is called';
  const emitWhenDecrementIsCalled = 'emits [-1] when decrement is called';
  group(
    counterCubit,
    () {
      test(
        initialState,
        () {
          expect(
            CounterCubit().state,
            equals(0),
          );
        },
      );

      blocTest<CounterCubit, int>(
        emitsWhenIncrementIsCalled,
        build: CounterCubit.new,
        act: (cubit) => cubit.increment(),
        expect: () => [equals(1)],
      );

      blocTest<CounterCubit, int>(
        emitWhenDecrementIsCalled,
        build: CounterCubit.new,
        act: (cubit) => cubit.decrement(),
        expect: () => [equals(-1)],
      );
    },
  );
}
