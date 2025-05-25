import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/application/remote_config/remote_config.dart';
import 'package:movie_tracker/application/injectable/injectable.dart';
import 'package:movie_tracker/application/screens/error_screen.dart';
import 'package:movie_tracker/application/screens/home_screen.dart';
import 'package:movie_tracker/application/screens/splash_screen.dart';
import 'package:movie_tracker/features/movie/presentation/movie_list_page.dart';
import 'package:movie_tracker/features/settings/presentation/settings_page.dart';

final router = GoRouter(
  refreshListenable: getIt<RemoteConfigViewModel>()..load(),
  redirect: (_, state) {
    final vm = getIt<RemoteConfigViewModel>();
    final location =
        state.matchedLocation == '/splash' ? '/movies' : state.matchedLocation;

    return switch (vm.state) {
      RemoteConfigInitial() || RemoteConfigLoading() => '/splash',
      RemoteConfigFailure() => '/error',
      RemoteConfigLoaded(:final config) => switch (config.mode) {
        AppMode.production => '/webview',
        AppMode.review => location,
      },
    };
  },
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: SplashScreen()),
    ),
    GoRoute(
      path: '/error',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: ErrorScreen()),
    ),
    GoRoute(
      path: '/webview',
      pageBuilder:
          (context, state) => const NoTransitionPage(
            child: Scaffold(body: Center(child: Text('webview'))),
          ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/movies',
              pageBuilder:
                  (context, state) =>
                      const NoTransitionPage(child: MovieListPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder:
                  (context, state) =>
                      const NoTransitionPage(child: SettingsPage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
