import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/router/router.dart';
import '/resource/interface/todo_pod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(todosPod.notifier);
    final active = read.active();
    final completed = read.completed();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Add Todo'),
                    content: TextField(
                      autofocus: true,
                      onSubmitted: (title) {
                        read.add(title);
                      },
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => router.go('/settings'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: active.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(active[index].id),
                  onDismissed: (_) => read.remove(active[index]),
                  child: CheckboxListTile(
                    title: Text(active[index].title),
                    value: active[index].check,
                    onChanged: (_) => read.check(active[index].id),
                  ),
                );
              },
            ),
          ),
          ExpansionTile(
            title: const Text('Completed'),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: completed.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(completed[index].title),
                    value: completed[index].check,
                    onChanged: (_) => read.check(completed[index].id),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
