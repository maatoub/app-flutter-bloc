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
          ListUsers listUsers = await usersRepo.searchUsers(
              event.keyword, event.pageSize, event.pageCurrent);
          int totalPages = (listUsers.totalCount / event.pageSize).floor();
          if (listUsers.totalCount % event.pageSize != 0) {
            totalPages = totalPages + 1;
          }
          emit(
            SearchUsersSuccessState(listUsers, event.pageCurrent, totalPages,
                event.pageSize, event.keyword),
          );
        } catch (e) {
          emit(SearchUsersErrorState(e.toString()));
        }
      },
    );
    on<NextPageEvent>(
      (event, emit) async {
        emit(SearchUsersLoadingState()); //to display icon progress
        try {
          ListUsers listUsers = await usersRepo.searchUsers(
            event.keyword,
            event.pageCurrent,
            event.pageSize,
          );
          int totalPages = (listUsers.totalCount / event.pageSize).floor();
          if (listUsers.totalCount % event.pageSize != 0) {
            totalPages = totalPages + 1;
          }
          emit(
            SearchUsersSuccessState(
              listUsers,
              event.pageCurrent,
              totalPages,
              event.pageSize,
              event.keyword,
            ),
          );
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
