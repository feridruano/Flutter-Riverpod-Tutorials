import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basic_state_providers/constants.dart';
import 'package:basic_state_providers/pages/change_notifier_provider_page.dart';
import 'package:basic_state_providers/pages/state_notifier_provider_page.dart';
import 'package:basic_state_providers/pages/counter_state_notifier_provider_page.dart';
import 'package:basic_state_providers/pages/state_provider_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic State Providers',
      initialRoute: homePage,
      routes: {
        homePage: (context) => const HomePage(),
        changeNotifierProviderRoute: (context) =>
            const ChangeNotifierProviderPage(),
        stateNotifierProviderRoute: (context) =>
            const StateNotifierProviderPage(),
        counterStateNotifierProviderRoute: (context) =>
            const CounterStateNotifierProviderPage(),
        stateProviderRoute: (context) => const StateProviderPage(),
      },
      home: Container(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Riverpod Providers'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, changeNotifierProviderRoute),
              child: const Text('Change Notifier'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, stateNotifierProviderRoute),
              child: const Text('State Notifier'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context, counterStateNotifierProviderRoute),
              child: const Text('Counter State Notifier'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, stateProviderRoute),
              child: const Text('State Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
