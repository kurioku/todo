import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/resource/interface/todo_pod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(todosPod);
    final read = ref.read(todosPod.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Folders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go('/settings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Add Folder'),
                    content: TextField(
                      autofocus: true,
                      onSubmitted: (title) {
                        read.add(title);
                        context.pop();
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: watch.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(watch[index].id),
            onDismissed: (_) {
              read.remove(watch[index]);
            },
            child: CheckboxListTile(
              title: Text(watch[index].title),
              value: watch[index].check,
              onChanged: (_) {
                read.check(watch[index].id);
              },
            ),
          );
        },
      ),
    );
  }
}
