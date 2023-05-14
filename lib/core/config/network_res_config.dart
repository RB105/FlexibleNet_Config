abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkSucceed extends NetworkResponse {
  NetworkSucceed();
}
class NetworkHttpError extends NetworkResponse {
  NetworkHttpError();
}
class NetworkException extends NetworkResponse {
  NetworkException();
}