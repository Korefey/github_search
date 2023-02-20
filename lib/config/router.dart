import 'package:flutter/material.dart';
import 'package:github_search/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      routes: const <RouteBase>[],
    ),
  ],
);
