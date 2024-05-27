// ignore_for_file: unused_element

import "package:bloc/bloc.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_event.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_state.dart";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0));

  Stream<CounterState> _mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(state.counter + 1);

      case CounterEvent.decrement:
        yield CounterState(state.counter - 1);

      case CounterEvent.other:
        yield const CounterState(0);
    }
  }
}
