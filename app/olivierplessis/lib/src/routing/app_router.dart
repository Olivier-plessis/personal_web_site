import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:olivierplessis/src/home/presentation/screen/home_screen.dart';
import 'package:olivierplessis/src/landing_screen.dart';
import 'package:olivierplessis/src/routing/not_found_screen.dart';
import 'package:olivierplessis/src/routing/route_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: AppPage.landing.routePath,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: AppPage.landing.routePath,
        name: AppPage.landing.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const LandingScreen(),
            barrierDismissible: true,
            barrierColor: Colors.black38,
            opaque: false,
            transitionDuration: const Duration(seconds: 5),
            reverseTransitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AppPage.home.routePath,
        name: AppPage.home.routeName,
        builder: (context, state) => const HomeScreen(),
        /*routes: [
          GoRoute(
            path: '${AppRoute.portfolio.name}/:slug',
            name: AppRoute.portfolio.name,
            builder: (context, state) {
              final productId = state.pathParameters['slug']!;
              return ProductScreen(slug: slug);
            },
          ),
        ],*/
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
