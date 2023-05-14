part of 'users_states.dart';

class UsersCubit extends Cubit<UsersStates> {
  UsersCubit() : super(UsersInitState()) {
    checkConnection();
  }

  // instance
  UsersRepository usersRepository = UsersRepository();

  // from local db
  Future<void> getUsersLocal() async {
    emit(UsersLoadingState());
    Isar db = await usersRepository.openIsar();
    if (await db.usersModels.count() == 0) {
      getUsersRemote();
    } else {
      emit(UsersOfflineState(await db.usersModels.where().findAll()));
    }
  }

  Future<void> getUsersRemote() async {
    emit(UsersLoadingState());
    await usersRepository.getUsers().then((value) {
      if (value is List<UsersModel>) {
        emit(UsersOnlineState(value));
      } else {
        emit(UsersErrorState(value));
      }
    });
  }

  final Connectivity _connectivity = Connectivity();
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  void checkConnection() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        getUsersRemote();
      } else {
        getUsersLocal();
      }
    });
  }
}
