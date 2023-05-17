part of 'currency_states.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit() : super(CurrencyInitState()) {
    getCurrency();
  }

  //
  CurrencyRepository currencyRepository = CurrencyRepository();

  //gets from repository
  Future<void> getCurrency() async {
    emit(CurrencyLoadingState());
    await currencyRepository.getCurrency().then((data) {
      if (data is List<CurrencyModel>) {
        emit(CurrencySuccseedState(data));
      } else {
        emit(CurrencyErrorState(data));
      }
    });
  }
}
