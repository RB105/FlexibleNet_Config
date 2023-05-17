
import 'package:flexible/cubit/currency/currency_states.dart';
import 'package:flexible/cubit/users/users_states.dart';
import 'package:flexible/view/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UsersCubit(),
    ),
    BlocProvider(create: (context) => CurrencyCubit(),)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CurrentScreen());
  }
}
