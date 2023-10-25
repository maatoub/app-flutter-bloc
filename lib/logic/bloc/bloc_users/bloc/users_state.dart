part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class SearchUsersSuccessState extends UsersState {
  final ListUsers listUsers;
  final int currentPage;
  final int sizePage;
  final int totalPage;
  final String currentKeywords;
  SearchUsersSuccessState(
    this.listUsers,
    this.currentPage,
    this.totalPage,
    this.sizePage,
    this.currentKeywords,
  );
}

final class SearchUsersLoadingState extends UsersState {}

final class SearchUsersErrorState extends UsersState {
  final String errorMessage;

  SearchUsersErrorState(this.errorMessage);
}
