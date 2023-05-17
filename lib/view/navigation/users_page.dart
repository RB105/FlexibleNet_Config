import 'package:flexible/core/widgets/home_users_list_widget.dart';
import 'package:flexible/cubit/users_cubit/users_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _HomePageState();
}

class _HomePageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit,UsersStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text("Users"),),
        body: Builder(builder: (context) {
          if (state is UsersLoadingState) {
            return const Center( child:  CircularProgressIndicator(),);
          }
          else if(state is UsersErrorState){
            return Center( child:  Text(state.error),);
          }
          else if(state is UsersOnlineState){
            return UserListBuilder(data: state.data);
          }
          else if(state is UsersOfflineState){
            return UserListBuilder(data: state.list);
          }
           else {
            return const SizedBox();
          }
        },),
      );
    },);
  }
}