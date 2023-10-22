import 'package:first_app/logic/bloc/bloc_counter/counter_bloc.dart';
import 'package:first_app/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Counter bloc"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if ((state is CounterSuccessState) || (state is CounterInitial)) {
              return Text("Counter value : ${state.counter}");
            } else if (state is CounterErrorState) {
              return Column(
                children: [
                  Text("Counter value : ${state.counter}"),
                  Text(state.errorMsg),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<CounterBloc>().add(
                    CounterDecrementEvent(),
                  );
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<CounterBloc>().add(
                    CounterIncrementEvent(),
                  );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
