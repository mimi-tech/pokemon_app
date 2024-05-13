import "package:equatable/equatable.dart";

abstract class Feedback extends Equatable {
  @override
  List<Object?> get props => [];
}

class TheFailure extends Feedback {
  TheFailure(this.exception);
  final String exception;

  @override
  String toString() {
    return exception;
  }
}
