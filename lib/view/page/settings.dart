import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/links/links.dart';
import '/core/router/router.dart';
import '/core/theme/theme_pod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: router.pop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Version'),
              subtitle: Text('0.1.6'),
            ),
            const ListTile(
              leading: Icon(Icons.code),
              title: Text('Source Code'),
              onTap: gitHub,
            ),
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
    );
  }
}
