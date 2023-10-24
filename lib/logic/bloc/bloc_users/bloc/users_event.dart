part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keyword;

  SearchUsersEvent({required this.keyword});
}
