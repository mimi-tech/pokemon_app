import "package:mimi_pokemon_app/app/bloc/Logic/card_state.dart";

class CardShowingButton extends CardState {
  const CardShowingButton(this.selectedIndex);
  final int selectedIndex;
  @override
  List<Object> get props => [selectedIndex];
}
