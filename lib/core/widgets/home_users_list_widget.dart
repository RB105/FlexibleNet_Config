
import 'package:flexible/data/model/users/users_model.dart';
import 'package:flutter/material.dart';

class UserListBuilder extends StatelessWidget {
  final List<UsersModel> data;
  const UserListBuilder({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
      return ListTile(title: Text(data[index].name.toString()),);
    },);
  }
}