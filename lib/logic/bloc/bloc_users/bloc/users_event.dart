part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keyword;
  final int pageCurrent;
  final int pageSize;
  SearchUsersEvent(this.keyword, this.pageCurrent, this.pageSize);
}

class NextPageEvent extends SearchUsersEvent {
  NextPageEvent(super.keyword, super.pageCurrent, super.pageSize);
}
