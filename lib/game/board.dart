import 'package:flutter/material.dart';

import 'box.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.boxSize,
    required this.values,
    required this.onCellTap,
    this.selectedBoxIndex,
    this.selectedCellIndex,
  });

  final double boxSize;
  final List<List<int>> values;
  final void Function(int, int) onCellTap;
  final int? selectedBoxIndex;
  final int? selectedCellIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxSize * 3,
      width: boxSize * 3,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (x) {
          return Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Box(
              boxSize: boxSize,
              values: values[x],
              isSelected: selectedBoxIndex == x,
              selectedCellIndex: selectedBoxIndex == x ? selectedCellIndex : null,
              onCellTap: (cellIndex) => onCellTap(x, cellIndex),
            ),
          );
        }),
      ),
    );
  }
}