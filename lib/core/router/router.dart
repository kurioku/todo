import 'package:go_router/go_router.dart';

import '/view/page/folder.dart';
import '/view/page/settings.dart';
import '/view/page/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => FolderPage(
            id: state.pathParameters['id']!,
            index: state.extra as int,
          ),
        ),
      ],
    ),
  ],
);
