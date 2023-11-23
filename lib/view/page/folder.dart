import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FolderPage extends HookConsumerWidget {
  const FolderPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: const Text(''),
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
                    if (value.isNotEmpty) {}
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
