import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(const CounterState(0));

  void increment() => emit(CounterState(state.counterValue + 1));

  void decrement() => emit(CounterState(state.counterValue - 1));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('counter')) {
      return CounterState.fromMap(json);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
