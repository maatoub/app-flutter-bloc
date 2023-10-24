part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class SearchUsersSuccessState extends UsersState {
  final ListUsers listUsers;

  SearchUsersSuccessState(this.listUsers);
}

final class SearchUsersLoadingState extends UsersState {}

final class SearchUsersErrorState extends UsersState {
  final String errorMessage;

  SearchUsersErrorState(this.errorMessage);
}
