import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_state_providers/providers.dart';

class AddTodoInput extends StatefulWidget {
  const AddTodoInput();
  @override
  _AddTodoInputState createState() => _AddTodoInputState();
}

class _AddTodoInputState extends State<AddTodoInput> {
  final _textEditingController = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmitted([String? description]) {
    context
        .read(todoListProvider.notifier)
        .add(_textEditingController.text.trim());
    _textEditingController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: 'New Todo'),
              onSubmitted: _onSubmitted,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _onSubmitted,
          ),
        ],
      ),
    );
  }
}
