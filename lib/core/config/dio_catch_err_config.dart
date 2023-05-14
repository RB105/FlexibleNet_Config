import 'package:dio/dio.dart';

class DioCatchError {
  static String catchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return "Connection Time Out";
      case DioErrorType.sendTimeout:
        return "Send Time Out";
      case DioErrorType.receiveTimeout:
        return "Receive Time Out";
      case DioErrorType.unknown:
        return "No internet Connection";
      default:
        return "Something went wrong";
    }
  }
}
