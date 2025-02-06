import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'board.dart';

class Puzzle extends StatelessWidget {
  const Puzzle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();
    var board= Board(boxSize: boxSize);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: board,
      ),
    );
  }
}

