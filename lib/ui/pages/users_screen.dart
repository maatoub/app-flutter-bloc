import 'package:first_app/logic/bloc/bloc_users/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController keywords = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("get users"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Expanded(

                  child: TextFormField(
                    controller: keywords,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          width: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      hintText: "Search....",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<UsersBloc>().add(
                          SearchUsersEvent(keyword: keywords.text),
                        );
                    keywords.text = "";
                  },
                  icon: const Icon(Icons.search),
                  color: Theme.of(context).primaryColor,
                  iconSize: 40,
                ),
              ],
            ),
          ),
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is SearchUsersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchUsersErrorState) {
                return Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Retry"),
                    ),
                  ],
                );
              } else if (state is SearchUsersSuccessState) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    state.listUsers.items[index].avatarUrl),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(state.listUsers.items[index].login),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 4,
                        );
                      },
                      itemCount: state.listUsers.items.length),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
