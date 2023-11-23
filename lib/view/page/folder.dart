import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/resource/interface/folder_pod.dart';

class FolderPage extends HookConsumerWidget {
  const FolderPage({
    super.key,
    required this.id,
    required this.index,
  });

  final String id;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderWatch = ref.watch(folderListPod)[index];
    final folderRead = ref.read(folderListPod.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(folderWatch.title),
      ),
      body: ListView.builder(
        itemCount: folderWatch.todos.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(folderWatch.todos[index].title),
            value: false,
            onChanged: (_) {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      folderRead.addTodo(value, folderWatch.id);
                    }
                    context.pop();
                  },
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
