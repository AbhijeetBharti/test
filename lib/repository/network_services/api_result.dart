class ApiResult<T> {
  ApiResult({required this.data, required this.statusCode});

  T data;

  int statusCode;
}
