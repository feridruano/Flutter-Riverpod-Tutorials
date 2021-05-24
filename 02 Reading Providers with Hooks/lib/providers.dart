import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/models/settings.dart';
import 'package:reading_providers_with_hooks/models/todo.dart';
import 'package:reading_providers_with_hooks/notifiers/todo_list_state_notifier.dart';

final todoListProvider =
    StateNotifierProvider<TodoListStateNotifier, List<Todo>>(
        (ref) => TodoListStateNotifier(ref.read, fakeTodos));

final completedTodoListProvider = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => todo.completed).toList();
});

final currentTodo = ScopedProvider<Todo>((_) => throw UnimplementedError());

final settingsProvider = StateProvider<Settings>((ref) => const Settings());
