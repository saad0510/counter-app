part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counterValue;

  const CounterState(this.counterValue);

  Map<String, dynamic> toMap() {
    return <String, int>{'counter': counterValue};
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(map['counter'] as int);
  }
}
