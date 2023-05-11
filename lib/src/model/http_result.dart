class HttpResult {
  HttpResult({
    required this.isSuccess,
    required this.result,
    required this.status,
  });

  bool isSuccess;
  dynamic result;
  int status;
}
