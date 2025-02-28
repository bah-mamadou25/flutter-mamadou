import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_starter/game/game.dart';

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
        builder: (context, state) => const Game(title: APP_TITLE),
      ),
    ],
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}