import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<SearchUsersEvent>(
      (event, emit) {
        print("------------------------");
        print(event);
        print(event.keyword);
        print("------------------------");
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