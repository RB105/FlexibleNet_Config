import 'package:dio/dio.dart';
import 'package:flexible/core/config/dio_catch_err_config.dart';
import 'package:flexible/core/config/dio_config.dart';
import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/core/constants/project_urls.dart';
import 'package:flexible/data/model/user_model.dart/users_model.dart';


class UsersService {
  Future<NetworkResponse> getUser() async {
    try {
      Response response =
          await DioConfig.createRequest().get(ProjectUrls.users);
      if (response.statusCode == 200) {
        return NetworkSucceed((response.data as List)
            .map((e) => UsersModel.fromJson(e))
            .toList());
      } else {
        return NetworkHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return NetworkException(DioCatchError.catchError(e));
    }
  }
}
