part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;

  const CounterState({required this.counter});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

final class CounterSuccessState extends CounterState {
  const CounterSuccessState({required super.counter});
}

final class CounterErrorState extends CounterState {
  final String errorMsg;

  const CounterErrorState({required this.errorMsg, required super.counter});
}
