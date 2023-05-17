import 'dart:io';

import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/data/model/currency_model/currency_model.dart';
import 'package:flexible/data/model/user_model/users_model.dart';
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
      return await Isar.open([UsersModelSchema,CurrencyModelSchema], directory: appDocDir.path);    
  }

  // put data
  Future<void> putToDatabase(List<UsersModel> data) async {
    await db.writeTxn(() async {
      await db.usersModels.clear();
      await db.usersModels.putAll(data);
    });
  }
}
