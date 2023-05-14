import 'dart:io';

import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/data/model/user_model.dart/users_model.dart';
import 'package:flexible/data/service/users_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UsersRepository {
  // instance
  UsersService usersService = UsersService();

  // isar localdb
  late Isar db;

  // from local db
  Future<dynamic> getUsersLocal() async {
    await openIsar();
    if (await db.usersModels.count() == 0) {
      return getUsersRemote();
    } else {
      return db.usersModels.where().findAll();
    }
  }

  // from network
  Future<dynamic> getUsersRemote() async {
    return await usersService.getUser().then((NetworkResponse response) async {
      if (response is NetworkSucceed<List<UsersModel>>) {
        await openIsar();
        await putToDatabase(response.model);
        return await db.usersModels.where().findAll();
      } else {
        return response;
      }
    });
  }

  //opens database
  Future<Isar> openIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UsersModelSchema], directory: appDocDir.path);
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  // put data
  Future<void> putToDatabase(List<UsersModel> data) async {
    db.writeTxn(() async {
      await db.usersModels.clear();
      await db.usersModels.putAll(data);
    });
  }
}
