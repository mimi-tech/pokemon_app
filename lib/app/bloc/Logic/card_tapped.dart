import "package:mimi_pokemon_app/app/bloc/Logic/card_event.dart";

class CardTapped extends CardEvent {
  const CardTapped(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
