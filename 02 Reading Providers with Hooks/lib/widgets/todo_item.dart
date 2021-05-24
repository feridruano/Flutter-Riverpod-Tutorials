import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/providers.dart';

class TodoItem extends HookWidget {
  const TodoItem();

  @override
  Widget build(BuildContext context) {
    final todo = useProvider(currentTodo);

    final itemFocusNode = useFocusNode();
    useListenable(itemFocusNode);
    final isFocused = itemFocusNode.hasFocus;

    final todoEditingController = useTextEditingController();
    final todoFocusNode = useFocusNode();

    void onFocusChange({required bool isFocused}) {
      if (isFocused) {
        todoEditingController.text = todo.description;
        todoEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: todoEditingController.text.length));
      } else {
        context
            .read(todoListProvider.notifier)
            .edit(todoEditingController.text.trim(), todo.id);
      }
    }

    void onTodoTap() {
      itemFocusNode.requestFocus();
      todoFocusNode.requestFocus();
    }

    // print({'$todo'}); // Used to text rebuilds of TodoItem

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        background: const ColoredBox(color: Colors.red),
        onDismissed: (_) =>
            context.read(todoListProvider.notifier).remove(todo.id),
        child: Focus(
          focusNode: itemFocusNode,
          onFocusChange: (focus) => onFocusChange(isFocused: focus),
          child: ListTile(
            onTap: onTodoTap,
            title: isFocused
                ? TextField(
                    autofocus: true,
                    focusNode: todoFocusNode,
                    controller: todoEditingController,
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
                  onPressed: () =>
                      context.read(todoListProvider.notifier).remove(todo.id),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
