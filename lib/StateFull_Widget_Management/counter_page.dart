import 'package:flutter/material.dart';

class StateFullCounterPage extends StatefulWidget {
  const StateFullCounterPage({super.key});

  @override
  State<StateFullCounterPage> createState() => _StateFullCounterPageState();
}

class _StateFullCounterPageState extends State<StateFullCounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('Rebuilding widget .....');
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page with Statefull Widget'),
      ),
      body: Center(
        child: Text(
          'Counter Value => $counter',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              ++counter;
            }),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () => setState(() {
              --counter;
            }),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}