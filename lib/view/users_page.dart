

import 'package:flexible/core/config/network_res_config.dart';
import 'package:flexible/core/widgets/home_users_list_widget.dart';
import 'package:flexible/data/model/user_model.dart/users_model.dart';
import 'package:flexible/data/service/users_service.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: FutureBuilder(
        future: UsersService().getUser(),
        builder: (context,AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.data is NetworkHttpError){
          return Center(child: Text(snapshot.data),);
        } else {
          List<UsersModel> data = (snapshot.data as NetworkSucceed<List<UsersModel>>).model;
          return UserListBuilder(data: data);
        }
      },),
    );
  }
}