import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reading_providers_with_hooks/providers.dart';

class AddTodoInput extends HookWidget {
  const AddTodoInput();

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    final focusNode = useFocusNode();

    void _onSubmitted(BuildContext context, String description) {
      if (description.isNotEmpty) {
        context.read(todoListProvider.notifier).add(description.trim());
        textEditingController.clear();
      }
      FocusManager.instance.primaryFocus?.unfocus();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              decoration: const InputDecoration(hintText: 'New Todo'),
              onSubmitted: (description) => _onSubmitted(context, description),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _onSubmitted(context, textEditingController.text),
          ),
        ],
      ),
    );
  }
}
