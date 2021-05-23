// Change Notifier
// State is not immutable
// We must manage the state
// Change Notifier allows us to manually notify listeners of a state change
// Useful for executing complex operations before a state change should occur
// State Notifier is more basic notifier to used

import 'package:flutter/material.dart';

class IntegerChangeNotifier extends ChangeNotifier {
  int count;
  IntegerChangeNotifier(this.count);

  void increment() {
    count = count + 1;
    notifyListeners();
  }

  void decrement() {
    count = count - 1;
    notifyListeners();
  }
}
