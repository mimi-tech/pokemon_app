import 'package:equatable/equatable.dart';

abstract class Feedback extends Equatable {
  @override
  List<Object?> get props => [];
}

class TheFailure extends Feedback {
  final String exception;
  TheFailure (this.exception);

  @override
  String toString() {
    return exception.toString();
  }
}

