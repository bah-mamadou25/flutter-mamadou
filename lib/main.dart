import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_starter/game/puzzle.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

const String APP_TITLE = 'Sudoku';
final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(title: APP_TITLE),
    routes: [
      GoRoute(
        path: '/game',
        builder: (context, state) => const Puzzle(title: APP_TITLE),
      ),
    ],
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
