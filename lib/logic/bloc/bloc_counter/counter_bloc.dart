import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementEvent>(
      (event, emit) {
        if (state.counter < 10) {
          emit(CounterSuccessState(counter: state.counter + 1));
        } else {
          emit(
            CounterErrorState(
                errorMsg: "error Increment number", counter: state.counter),
          );
        }
      },
    );
    on<CounterDecrementEvent>(
      (event, emit) {
        if (state.counter > 0) {
          emit(CounterSuccessState(counter: state.counter - 1));
        } else {
          emit(
            CounterErrorState(
                errorMsg: "error Decrement number", counter: state.counter),
          );
        }
      },
    );
  }
}
