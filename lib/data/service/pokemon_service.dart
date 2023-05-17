import 'package:dio/dio.dart';
import 'package:flexible/core/config/dio_catch_err_config.dart';
import 'package:flexible/core/config/dio_config.dart';
import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/core/constants/project_urls.dart';
import 'package:flexible/data/model/pokemon/pokemon_model.dart';

class PokemonService {
  Future<NetworkResponse> getPokemon() async {
    try {
      Response response = await DioConfig.createRequest().get(ProjectUrls.pokemon);

      if (response.statusCode == 200) {
        return NetworkSucceed(PokemonModel.fromJson(response.data));
      } else {
        return NetworkHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return NetworkException(DioCatchError.catchError(e));
    }
  }
}
