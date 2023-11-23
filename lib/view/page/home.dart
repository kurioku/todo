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
    final completed = watch.where((t) => t.check).toList();
    final active = watch.where((t) => !t.check).toList();
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
      body: Column(
        children: [
          ListView.builder(
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
          const Spacer(),
          ExpansionTile(
            title: Text('Completed ${completed.length}'),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: completed.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(completed[index].id),
                    onDismissed: (_) => read.remove(completed[index]),
                    child: CheckboxListTile(
                      title: Text(completed[index].title),
                      value: completed[index].check,
                      onChanged: (_) => read.check(completed[index].id),
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
