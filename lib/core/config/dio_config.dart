import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
      validateStatus: (int? status) {
        if (status != null) {
          if (status >= 100 && status <= 599) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
    ));

    //time configration
    dio.options.sendTimeout = const Duration(seconds: 5);
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);

    return dio;
  }
}
