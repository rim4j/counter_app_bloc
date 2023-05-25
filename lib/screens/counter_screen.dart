import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state.status == CounterStatus.initial ||
                state.status == CounterStatus.loading) {
              return const CircularProgressIndicator();
            }

            if (state.status == CounterStatus.success) {
              return Text("The counter value is: ${state.counter.value}");
            } else {
              return const Text("something went wrong");
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "counter add",
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrement());
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "counter remove",
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrement());
            },
          ),
        ],
      ),
    );
  }
}
