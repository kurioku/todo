import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'resource/interface/todo_pod.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_pod.dart';
import 'core/router/router.dart';

late final SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(todosPod.notifier).initLoad();
    return Consumer(
      builder: (_, ref, __) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Todo',
          themeMode: ref.watch(themePod),
          theme: Themes.light,
          darkTheme: Themes.dark,
        );
      },
    );
  }
}
