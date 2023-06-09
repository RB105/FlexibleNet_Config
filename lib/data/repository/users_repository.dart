import 'dart:io';

import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/data/model/currency/currency_model.dart';
import 'package:flexible/data/model/users/users_model.dart';
import 'package:flexible/data/service/users_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UsersRepository {
  // instance
  UsersService usersService = UsersService();

  // isar localdb
  late Isar db;

  // from network
  Future<dynamic> getUsers() async {
    return await usersService.getUser().then((NetworkResponse response) async {
      if (response is NetworkSucceed<List<UsersModel>>) {
        db = await openIsar();
        await putToDatabase(response.model);
        return await db.usersModels.where().findAll();
      } else {
        return response.toString();
      }
    });
  }

  //opens database
  Future<Isar> openIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
      if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UsersModelSchema,CurrencyModelSchema], directory: appDocDir.path);
    } else {
      return await Future.value(Isar.getInstance());
    }    
  }

  // put data
  Future<void> putToDatabase(List<UsersModel> data) async {
    await db.writeTxn(() async {
      await db.usersModels.clear();
      await db.usersModels.putAll(data);
    });
  }
}
