// State Provider Page
// A basic page with a counter with decrement and increment buttons.
// However, state is externally modifiable! because we are use a basic StateProvider
// without a notifier. No need to read through a provider's notifier.
// ConsumerWidget replaces StatelessWidget to watch state changes and rebuild
// There is a better Consumer widget that allow us to keep StatelessWidget and
// only rebuild the widgets necessary when the state changes. Not shown in this project.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basic_state_providers/providers.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final count = watch(integerStateProvider);
    final isCountTriple = watch(isTriple);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic State Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${count.state} : ${isCountTriple ? 'Is Triple' : 'Not Triple'}',
            style: const TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => count.state--,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.exposure_minus_1),
                ),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed: () => count.state++,
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
