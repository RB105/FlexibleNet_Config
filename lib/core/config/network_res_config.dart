abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkSucceed<T> extends NetworkResponse {
  T model;
  NetworkSucceed(this.model);
}
class NetworkHttpError extends NetworkResponse {
  String statusMessage;
  NetworkHttpError(this.statusMessage);
}
class NetworkException extends NetworkResponse {
  String exception;
  NetworkException(this.exception);
}