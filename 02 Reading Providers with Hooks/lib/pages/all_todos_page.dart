import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/providers.dart';
import 'package:reading_providers_with_hooks/widgets/add_todo_input.dart';
import 'package:reading_providers_with_hooks/widgets/todo_item.dart';

class AllTodosPage extends StatelessWidget {
  const AllTodosPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddTodoInput(),
        const SizedBox(height: 32),
        Consumer(
          builder: (context, watch, child) {
            final todos = watch(todoListProvider);
            return Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ProviderScope(
                    overrides: [currentTodo.overrideWithValue(todos[index])],
                    child: const TodoItem(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
