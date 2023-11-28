import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/router/router.dart';
import '/resource/interface/todo_pod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(todosPod.notifier);
    final active = ref.watch(activePod);
    final completed = ref.watch(completedPod);
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
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                      'Add Todo',
                      textAlign: TextAlign.center,
                    ),
                    content: TextField(
                      autofocus: true,
                      onSubmitted: (title) => read.add(title),
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
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: active.length,
              separatorBuilder: (_, __) {
                return const Divider(height: 0);
              },
              itemBuilder: (_, i) {
                return Dismissible(
                  key: ValueKey(active[i].id),
                  onDismissed: (_) => read.remove(active[i]),
                  child: CheckboxListTile(
                    title: Text(active[i].title),
                    value: active[i].check,
                    onChanged: (_) => read.check(active[i].id),
                    secondary: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text(
                                'Edit Todo',
                                textAlign: TextAlign.center,
                              ),
                              content: TextField(
                                autofocus: true,
                                onSubmitted: (title) => read.edit(
                                  id: active[i].id,
                                  title: title,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
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
                itemBuilder: (_, i) {
                  return Dismissible(
                    key: ValueKey(completed[i].id),
                    onDismissed: (_) => read.remove(completed[i]),
                    child: CheckboxListTile(
                      title: Text(completed[i].title),
                      value: completed[i].check,
                      onChanged: (_) => read.check(completed[i].id),
                    ),
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
