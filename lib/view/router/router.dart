import 'package:go_router/go_router.dart';

import '../page/home.dart';
import '../page/settings.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const Settings(),
        ),
      ],
    ),
  ],
);
