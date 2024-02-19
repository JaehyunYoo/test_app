import 'package:chat_app/app/presentation/presentation.dart';
import 'package:chat_app/app/presentation/screens/s_a.dart';
import 'package:chat_app/core/routes/vo_route_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/screens/s_b.dart';
import '../../app/presentation/screens/s_c.dart';
import '../../app/presentation/screens/s_d.dart';
import '../../app/presentation/screens/test_screen.dart';

final router = GoRouter(
  initialLocation: RoutePath.splash.path,
  routes: [
    GoRoute(
      path: RoutePath.splash.path,
      name: RoutePath.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return RootScreen(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/root/a',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: AScreen(),
            transitionsBuilder: (context, ani, secondAni, child) {
              return FadeTransition(
                opacity: ani,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/root/b',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: BScreen(),
            transitionsBuilder: (context, ani, secondAni, child) {
              return FadeTransition(
                opacity: ani,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/root/c',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: CScreen(),
            transitionsBuilder: (context, ani, secondAni, child) {
              return FadeTransition(
                opacity: ani,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/root/d',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: DScreen(),
            transitionsBuilder: (context, ani, secondAni, child) {
              return FadeTransition(
                opacity: ani,
                child: child,
              );
            },
          ),
        ),
      ],
    ),
  ],
);
