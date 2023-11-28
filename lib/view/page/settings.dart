import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/git_pod.dart';
import '/core/theme/theme_pod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Version'),
                subtitle: Text('0.1.0'),
              ),
              ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('Source Code'),
                  onTap: () => ref.read(gitPod)),
              const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Developed by kurioku'),
              ),
              ListTile(
                title: const Text('Theme Mode'),
                leading: ref.watch(themeIconPod),
                trailing: DropdownButton(
                  value: ref.watch(themeIntPod),
                  onChanged: (v) => ref.read(themeIntPod.notifier).change(v!),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('System'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Dark'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
