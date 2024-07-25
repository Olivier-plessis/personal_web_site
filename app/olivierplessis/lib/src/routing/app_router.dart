import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/portfolio/portfolio_detail_layout.dart';
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
        builder: (BuildContext context, GoRouterState state) {
          return const LandingScreen();
        },
      ),
      GoRoute(
        path: AppPage.home.routePath,
        name: AppPage.home.routeName,
        builder: (context, state) => const MainHomeScreen(),
        routes: [
          GoRoute(
              path: '${AppPage.portfolio.name}/:slug',
              name: AppPage.portfolio.name,
              pageBuilder: (
                context,
                state,
              ) {
                final slug = state.pathParameters['slug']!;
                final workItem =
                    state.extra is WorkItem ? state.extra as WorkItem : null;

                return CustomTransitionPage<void>(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  key: state.pageKey,
                  child: PortfolioDetailLayout(slug: slug, workItem: workItem),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  opaque: false,
                );
              }),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
