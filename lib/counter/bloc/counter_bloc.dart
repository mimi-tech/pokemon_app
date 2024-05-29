import "package:bloc/bloc.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_event.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_state.dart";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<CounterEvent>(_counterEvent);
  }

  void _counterEvent(CounterEvent event, Emitter<CounterState> emit) {
    switch (event) {
      case CounterEvent.increment:
        emit(CounterState(state.counter + 1));

      case CounterEvent.decrement:
        emit(CounterState(state.counter - 1));

      case CounterEvent.other:
        emit(const CounterState(0));
    }
  }
}
