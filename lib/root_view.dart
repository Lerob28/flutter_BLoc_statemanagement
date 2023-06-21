
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/BLoc_State_Management/bloc_counter.dart';
import 'package:flutter_bloc_state_management/BLoc_State_Management/counter_page.dart';
import 'package:flutter_bloc_state_management/Home_page.dart';
import 'package:flutter_bloc_state_management/StateFull_Widget_Management/counter_page.dart';


class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
      ], 
      child: MaterialApp(
        routes: {
          '/': (context) => const HomeScreen(),
          '/statefull': (context) => const StateFullCounterPage(),
          '/bloc': (context) =>  BlocCounterPage(),
        },
        initialRoute: '/',
      )
    );
  }
}