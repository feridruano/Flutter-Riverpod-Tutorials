import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/providers.dart';
import 'package:reading_providers_with_hooks/widgets/todo_item.dart';

class CompletedTodosPage extends StatelessWidget {
  const CompletedTodosPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, watch, child) {
            final completedTodos = watch(completedTodoListProvider);
            return Expanded(
              child: ListView.builder(
                itemCount: completedTodos.length,
                itemBuilder: (context, index) {
                  return ProviderScope(
                    overrides: [
                      currentTodo.overrideWithValue(completedTodos[index])
                    ],
                    child: const TodoItem(),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
