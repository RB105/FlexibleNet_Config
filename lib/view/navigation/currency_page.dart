import 'package:flexible/core/widgets/currency_list_builder.dart';
import 'package:flexible/core/widgets/shimer_list_view_loading.dart';
import 'package:flexible/cubit/currency/currency_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Currency"),
          ),
          body: Builder(
            builder: (context) {
              if (state is CurrencyLoadingState) {
                return const ShimmerListView();
              } else if (state is CurrencyErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is CurrencySuccseedState) {
                return CurrencyListBuilder(data: state.data);
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
