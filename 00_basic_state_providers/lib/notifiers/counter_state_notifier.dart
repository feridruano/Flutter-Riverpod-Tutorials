// State Notifier
// State is immutable
// Immutablility forces us to create a new object for each state change
// State is only modifiable through operations within the class itself
// State Notifier automatically notifies listeners of state changes
// State is stored in StateNotifier class and of <data type>
//  In this case a primative integer wrapped as a counter object <Counter>
// State is instantiated via the super() constructor

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basic_state_providers/models/counter.dart';

class CounterStateNotifer extends StateNotifier<Counter> {
  CounterStateNotifer() : super(Counter(0));

  void increment() {
    state = Counter(state.count + 1);
  }

  void decrement() {
    state = Counter(state.count - 1);
  }
}
