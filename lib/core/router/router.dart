import 'package:go_router/go_router.dart';

import '../../view/page/home.dart';
import '../../view/page/settings.dart';

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
