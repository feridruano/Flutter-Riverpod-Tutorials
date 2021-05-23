import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_state_providers/models/settings.dart';
import 'package:reading_state_providers/providers.dart';

enum _MenuOptions { deleteOnComplete }

class AppBarMenu extends ConsumerWidget {
  const AppBarMenu();

  Future<void> _onSelected(BuildContext context, _MenuOptions option) async {
    if (option == _MenuOptions.deleteOnComplete) {
      final currentSetting =
          context.read(settingsProvider).state.deleteOnComplete;
      context.read(settingsProvider).state =
          Settings(deleteOnComplete: !currentSetting);
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isChecked = watch(settingsProvider).state.deleteOnComplete;
    return PopupMenuButton<_MenuOptions>(
      icon: const Icon(Icons.menu),
      onSelected: (value) => _onSelected(context, value),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _MenuOptions.deleteOnComplete,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(value: isChecked, onChanged: null),
              const Text('Delete on Completion'),
            ],
          ),
        ),
      ],
    );
  }
}
