import 'package:bloc/bloc.dart';
import 'package:flexible/cubit/users_cubit/users_states.dart';
import 'package:flexible/data/model/currency_model/currency_model.dart';
import 'package:flexible/data/repository/currency_repository.dart';

part 'currency_cubit.dart';

abstract class CurrencyStates {
  CurrencyStates();
}

class CurrencyInitState extends CurrencyStates {
  CurrencyInitState();
}

class CurrencyLoadingState extends CurrencyStates {
  CurrencyLoadingState();
}

class CurrencyErrorState extends CurrencyStates {
  final String error;

  CurrencyErrorState(this.error);
}

class CurrencySuccseedState extends CurrencyStates {
  final List<CurrencyModel> data;

  CurrencySuccseedState(this.data);
}
