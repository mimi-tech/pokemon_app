import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class TheFailure extends Failure {
  final dynamic exception;
  TheFailure (this.exception);

  @override
  String toString() {
    return exception.toString();
  }
}