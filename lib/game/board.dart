import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'box.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.boxSize,
  });

  final double boxSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxSize * 3,
      width: boxSize * 3,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (x) {
          var matrix = Box(boxSize: boxSize);
          return Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: matrix
          );
        }),
      ),
    );
  }
}