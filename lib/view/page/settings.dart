import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/theme/theme_pod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: const Text('Theme Mode'),
        trailing: DropdownButton(
          value: ref.watch(themeSPod),
          onChanged: (v) => ref.read(themeSPod.notifier).change(v!),
          items: const [
            DropdownMenuItem(
              value: 'system',
              child: Text('System'),
            ),
            DropdownMenuItem(
              value: 'light',
              child: Text('Light'),
            ),
            DropdownMenuItem(
              value: 'dark',
              child: Text('Dark'),
            ),
          ],
        ),
      ),
    );
  }
}
