import 'package:bloc/bloc.dart';
import 'package:flexible/data/model/users/users_model.dart';
import 'package:flexible/data/repository/users_repository.dart';
import 'package:isar/isar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


part 'users_cubit.dart';

abstract class UsersStates {
  UsersStates();
}

class UsersInitState extends UsersStates {
  UsersInitState();
}
class UsersLoadingState extends UsersStates {
  UsersLoadingState();
}

class UsersErrorState extends UsersStates {
  String error;
  UsersErrorState(this.error);
}

class UsersOnlineState extends UsersStates {
  List<UsersModel> data;
  UsersOnlineState(this.data);
}

class UsersOfflineState extends UsersStates {
  List<UsersModel> list;
  UsersOfflineState(this.list);
}
