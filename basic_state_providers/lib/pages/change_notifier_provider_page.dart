// Change Notifier Provider Page
// State = A primative integer.
// A basic page with a counter with decrement and increment buttons.
// However, state is NOT externally modifiable and NOT immutable. Therefore, we
// must read through a provider's notifier to access a state's operations.
// ConsumerWidget replaces StatelessWidget to watch state changes and rebuild
// There is a better Consumer widget allows us to keep StatelessWidget and
// only rebuild the widgets necessary when the state changes. Not shown in this project.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basic_state_providers/providers.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final int count = watch(integerChangeNotifierProvider).count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: const TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    context.read(integerChangeNotifierProvider).decrement,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.exposure_minus_1),
                ),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed:
                    context.read(integerChangeNotifierProvider).increment,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.exposure_plus_1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
