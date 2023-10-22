import 'package:flutter/material.dart';

class CounterStateFulScreen extends StatefulWidget {
  const CounterStateFulScreen({super.key});

  @override
  State<CounterStateFulScreen> createState() => _CounterStateFulScreenState();
}

class _CounterStateFulScreenState extends State<CounterStateFulScreen> {
  int counter = 0;
  String messageError = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter state full"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter value $counter"),
          Text(messageError),
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              setState(() {
                messageError = "";
                if (counter > 0) {
                  --counter;
                } else {
                  messageError = "error decrement";
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              setState(
                () {
                  if (counter < 10) {
                    ++counter;
                  } else {
                    messageError = "error increment";
                  }
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
