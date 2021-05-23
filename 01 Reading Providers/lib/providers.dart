import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_state_providers/models/settings.dart';
import 'package:reading_state_providers/models/todo.dart';
import 'package:reading_state_providers/notifiers/todo_list_state_notifier.dart';

final todoListProvider =
    StateNotifierProvider<TodoListStateNotifier, List<Todo>>(
        (ref) => TodoListStateNotifier(ref.read, fakeTodos));

final completedTodoListProvider = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => todo.completed).toList();
});

final currentTodo = ScopedProvider<Todo>((_) => throw UnimplementedError());

final settingsProvider = StateProvider<Settings>((ref) => const Settings());
