class ApiException implements Exception {
  const ApiException(this.exception);
  final String exception;

  @override
  String toString() {
    return exception;
  }
}
