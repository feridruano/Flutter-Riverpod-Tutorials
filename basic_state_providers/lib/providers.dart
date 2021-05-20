// Basic creation of Riverpod Providers
// Riverpod Providers are used to expose states
// Riverpod Providers are globals
// Accessible within the scope of the ProviderScope widget (main.dart)

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basic_state_providers/Notifiers/change_notifier.dart';
import 'package:basic_state_providers/Notifiers/state_notifier.dart';
import 'package:basic_state_providers/Notifiers/counter_state_notifier.dart';
import 'package:basic_state_providers/models/counter.dart';

// Instantiate the notifier only
final integerChangeNotifierProvider =
    ChangeNotifierProvider((ref) => IntegerChangeNotifier(0));

// <Notifier Class, State Class Type>
final integerStateNotifierProvider =
    StateNotifierProvider<IntegerStateNotifer, int>(
        (ref) => IntegerStateNotifer());

// <Notifier Class, State Class Type>
final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifer, Counter>(
        (ref) => CounterStateNotifer());

// Alternative to creating a notifier. Very basic and externally modifiable!
// <Class Type>
final integerStateProvider = StateProvider<int>((ref) => 0);

// Combining Providers (i.e THIS provider reading the state of another provider)
// (ref) allows use to reference other Riverpod providers and watch their state changes
final isTriple =
    Provider((ref) => ref.watch(integerStateProvider).state % 3 == 0);

// If we wanted isTriple for all three providers above, we would need to create
// three Providers() that reference their respective Notifier Provider.
// There most likely a better solution, but this is the basics and
// currently learning what's avaliable to us as well.
