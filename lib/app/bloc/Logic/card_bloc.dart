/*
 When I added an int as an annotation. I was still getting the error
 */

import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/card_event.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/card_initial.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/card_showing_button.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/card_state.dart";
import "package:mimi_pokemon_app/app/bloc/Logic/card_tapped.dart";

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardInitial()) {
    on<CardTapped>((event, emit) async {
      emit(CardShowingButton(event.index));
    });
  }
}
