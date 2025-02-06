import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

import 'box.dart';

class Board extends StatefulWidget {
  const Board({
    super.key,
    required this.boxSize,
  });

  final double boxSize;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<List<int>>? _matrix;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  Future<void> _generatePuzzle() async {
    var puzzleOptions = PuzzleOptions(patternName: "winter");
    var puzzleApi = Puzzle(puzzleOptions);
    await puzzleApi.generate();
    setState(() {
      // Init board's matrix to a matrix of solvable integers
      // If a cell's value is null, replace it with 0
      _matrix = puzzleApi.board()
          ?.matrix()?.map((row)
                => row.map((cell)
                        => cell.getValue() ?? 0).toList()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_matrix == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: widget.boxSize * 3,
      width: widget.boxSize * 3,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (x) {
          return Container(
            width: widget.boxSize,
            height: widget.boxSize,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Box(
              boxSize: widget.boxSize,
              values: _matrix![x],
            ),
          );
        }),
      ),
    );
  }
}