import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_state_providers/providers.dart';
import 'package:reading_state_providers/widgets/todo_item.dart';

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
