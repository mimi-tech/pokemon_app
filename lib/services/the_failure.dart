import "package:mimi_pokemon_app/services/feedback.dart";

class TheFailure extends Feedback {
  TheFailure(this.exception);
  final String exception;

  @override
  String toString() {
    return exception;
  }
}
