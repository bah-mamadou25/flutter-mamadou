import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.boxSize,
    required this.values,
    required this.expectedValues,
    required this.isSelected,
    required this.selectedCellIndex,
    required this.onCellTap,
  });

  final double boxSize;
  final List<int> values;
  final List<int> expectedValues;
  final bool isSelected;
  final int? selectedCellIndex;
  final void Function(int) onCellTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          int value = values[index];
          int expectedValue = expectedValues[index];
          bool cellIsSelected = isSelected && selectedCellIndex == index;
          return InkWell(
            onTap: () => onCellTap(index),
            child: Container(
              width: boxSize / 3,
              height: boxSize / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: cellIsSelected
                    ? Colors.blueAccent.shade100.withAlpha(100)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  value == 0 ? expectedValue.toString() : value.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: value == 0 ? Colors.black12 : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}