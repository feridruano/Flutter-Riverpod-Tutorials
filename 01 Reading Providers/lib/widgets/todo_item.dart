import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_state_providers/providers.dart';

class TodoItem extends StatefulWidget {
  const TodoItem();

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final TextEditingController _todoEditingController = TextEditingController();
  late FocusNode _todoFocusNode;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _todoFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _todoEditingController.dispose();
    _todoFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange(String todoDescription,
      {required bool isFocused, required String id}) {
    if (!isFocused) {
      setState(() {
        _hasFocus = false;
      });
      context
          .read(todoListProvider.notifier)
          .edit(_todoEditingController.text.trim(), id); // Submit Edit
    } else {
      _todoEditingController.text = todoDescription;
      _todoEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _todoEditingController.text.length),
      );
    }
  }

  void _onTodoTap() {
    setState(() {
      _hasFocus = true;
    });
    _todoFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer(
        builder: (context, watch, child) {
          final todo = watch(currentTodo);
          // print({'$todo'}); // Used to text rebuilds of TodoItem
          return Dismissible(
            key: UniqueKey(),
            background: const ColoredBox(color: Colors.red),
            onDismissed: (_) =>
                context.read(todoListProvider.notifier).remove(todo.id),
            child: FocusScope(
              child: Focus(
                onFocusChange: (value) => _onFocusChange(todo.description,
                    isFocused: value, id: todo.id),
                child: ListTile(
                  onTap: _onTodoTap,
                  title: _hasFocus
                      ? TextField(
                          focusNode: _todoFocusNode,
                          controller: _todoEditingController,
                        )
                      : Text(todo.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: todo.completed,
                        onChanged: (_) => context
                            .read(todoListProvider.notifier)
                            .toggle(todo.id, completed: todo.completed),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read(todoListProvider.notifier)
                            .remove(todo.id),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
