// State Notifier
// State is immutable
// Immutablility forces us to create a new object for each state change
// State is only modifiable through operations within the class itself
// State Notifier automatically notifies listeners of state changes
// State is stored in StateNotifier class and of <data type>
//  In this case a primative integer <int>
// State is instantiated via the super() constructor

import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntegerStateNotifer extends StateNotifier<int> {
  IntegerStateNotifer() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
