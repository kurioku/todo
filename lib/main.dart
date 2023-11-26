import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'resource/interface/todo_pod.dart';
import 'view/theme/theme_pod.dart';
import 'view/router/router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(todosPod.notifier).initLoad();
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo',
      themeMode: ref.watch(themePod),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
