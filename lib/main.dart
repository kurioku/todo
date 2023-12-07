import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/theme.dart';
import 'core/theme/theme_pod.dart';
import 'core/router/router.dart';
import 'data/storage.dart';
import 'resource/model/todo.dart';

late final SharedPreferences prefs;
late final List<Todo> todos;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  todos = await load();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo',
      themeMode: ref.watch(themePod),
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
