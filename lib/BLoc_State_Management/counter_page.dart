import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/BLoc_State_Management/bloc_counter.dart';

class BlocCounterPage extends StatelessWidget {
  BlocCounterPage({super.key});
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page with BLoc'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if(state is SuccessCounterState || state is CounterInitialState) {
              return Text(
                'Counter Value => ${state.counter}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              );
            }
            if (state is ErrorCounterState) { 
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counter Value => ${state.counter}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'message => ${state.errorMessage}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(AddValueToCounterEvent(incrementStep: 5)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 3),
                Text(
                  '5',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementCounterEvent()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementCounterEvent()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}