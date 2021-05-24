import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/models/todo.dart';
import 'package:reading_providers_with_hooks/providers.dart';

List<Todo> fakeTodos = [
  Todo('Eat'),
  Todo('Sleep'),
  Todo('Repeat'),
];

class TodoListStateNotifier extends StateNotifier<List<Todo>> {
  final Reader _read;
  TodoListStateNotifier(this._read, [List<Todo>? todos])
      : super(todos ?? <Todo>[]);

  void add(String description) {
    state = state..add(Todo(description));
  }

  void remove(String id) {
    state = state..removeWhere((todo) => todo.id == id);
  }

  void toggle(String id, {required bool completed}) {
    if (_read(settingsProvider).state.deleteOnComplete && !completed) {
      remove(id);
      return;
    }
    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(todo.description, completed: !todo.completed, id: todo.id);
      }
      return todo;
    }).toList();
  }

  void edit(String description, String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(description, completed: todo.completed, id: todo.id);
      }
      return todo;
    }).toList();
  }
}
