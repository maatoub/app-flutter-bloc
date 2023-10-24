import 'package:bloc/bloc.dart';
import 'package:first_app/models/users_model.dart';
import 'package:first_app/repository/users_repository.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRepository usersRepo = UsersRepository();
  UsersBloc() : super(UsersInitial()) {
    on<SearchUsersEvent>(
      (event, emit) async {
        emit(SearchUsersLoadingState()); //to display icon progress
        try {
          ListUsers listUsers =
              await usersRepo.searchUsers(event.keyword, 10, 50);
          emit(SearchUsersSuccessState(listUsers));
        } catch (e) {
          emit(SearchUsersErrorState(e.toString()));
        }
      },
    );
  }
}
/*********                 Test            *********/

/* (event, emit) {
        print("------------------------");
        print(event);
        print(event.keyword);
        print("------------------------");
      },
   */
