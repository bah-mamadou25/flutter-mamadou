import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.boxSize,
  });

  final double boxSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            width: boxSize / 3,
            height: boxSize / 3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                'T',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }
}