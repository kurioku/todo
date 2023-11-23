import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/resource/interface/folder_pod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderWatch = ref.watch(folderListPod);
    final folderRead = ref.read(folderListPod.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Folders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go('/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: folderWatch.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(folderWatch[index].title),
            onTap: () => context.go(
              '/:id',
              extra: index,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Folder'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      folderRead.addFolder(value);
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
