import 'package:flexible/data/model/currency/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyListBuilder extends StatelessWidget {
  final List<CurrencyModel> data;
  const CurrencyListBuilder({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
      return ListTile(title: Text(data[index].title.toString()),);
    },);
  }
}