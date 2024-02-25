class ApiError implements Exception {
  ApiError({required this.errorMessage, required this.statusCode});

  String errorMessage;
  int statusCode;

  @override
  String toString() => errorMessage;
}
