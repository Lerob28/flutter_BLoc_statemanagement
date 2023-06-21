import 'package:bloc/bloc.dart';

/* -------- Declaration des Evennements a traiter dans le BLoC (Actions) --------- */
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {
}

class DecrementCounterEvent extends CounterEvent {
}

class AddValueToCounterEvent extends CounterEvent {
  final int incrementStep;
  AddValueToCounterEvent({required this.incrementStep});
}





/* -------- Declaration des States apres traitement dans le BLoC (Resultats) --------- */
abstract class CounterState {
  final int counter;
  CounterState({required this.counter});
}

class SuccessCounterState extends CounterState {
  SuccessCounterState({required super.counter});
}

class ErrorCounterState extends CounterState {
  final String errorMessage;
  ErrorCounterState({required super.counter, required this.errorMessage});
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter: 0);
}


/* ------------------------- Logique de traitement du state ------------------ */
class CounterBloc extends Bloc<CounterEvent,CounterState> {
  CounterBloc():super(CounterInitialState()) {
    on<IncrementCounterEvent>((event, emit) {
      if (state.counter < 10) {
        emit(SuccessCounterState(counter: state.counter + 1));
      }else {
        emit(ErrorCounterState(counter: state.counter, errorMessage: 'le compteur a atteint sa valeur max'));
      }
    });
    on<DecrementCounterEvent>((event, emit) {
      if (state.counter > 0) {
        emit(SuccessCounterState(counter: state.counter - 1));
      }else {
        emit(ErrorCounterState(counter: state.counter, errorMessage: 'le compteur ne peut etre négatif'));
      }
    });
    on<AddValueToCounterEvent>((event, emit) {
       int value =  state.counter + event.incrementStep;
       if (value <= 10) {
        emit(SuccessCounterState(counter: value));
      }else {
        emit(ErrorCounterState(counter: state.counter, errorMessage: 'Action Impossible, le compteur va depasser sa limite'));
      }
    });
  }
  
}