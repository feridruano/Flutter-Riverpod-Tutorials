import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/pages/all_todos_page.dart';
import 'package:reading_providers_with_hooks/pages/completed_todos_page.dart';
import 'package:reading_providers_with_hooks/widgets/app_bar_menu.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading State Providers',
      home: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          centerTitle: true,
          actions: const [AppBarMenu()],
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('All Todos'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Completed Todos'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllTodosPage(),
            CompletedTodosPage(),
          ],
        ),
      ),
    );
  }
}
