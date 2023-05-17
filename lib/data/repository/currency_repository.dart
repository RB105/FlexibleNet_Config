import 'dart:io';

import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/data/model/currency_model/currency_model.dart';
import 'package:flexible/data/service/currency_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class CurrencyRepository {
  // instance
  CurrencyService currencyService = CurrencyService();

  // DB
  late Isar currencyDB;

  Future<dynamic> getCurrency() async {
    return await currencyService
        .getCurrency()
        .then((NetworkResponse response) async {
      if (response is NetworkSucceed<List<CurrencyModel>>) {
        // initialization
        currencyDB = await openIsar();
        await putToDatabase(response.model);
        return currencyDB;
      } else {
        return response;
      }
    });
  }

  //opens database
  Future<Isar> openIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([CurrencyModelSchema], directory: appDocDir.path);
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  // put data
  Future<void> putToDatabase(List<CurrencyModel> data) async {
    await currencyDB.writeTxn(() async {
      await currencyDB.currencyModels.clear();
      await currencyDB.currencyModels.putAll(data);
    });
  }
}
