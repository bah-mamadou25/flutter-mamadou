import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

import 'board.dart';
import 'keyboard.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<List<int>>? _matrix;
  List<List<int>>? _expectedMatrix;
  int? _selectedBoxIndex;
  int? _selectedCellIndex;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  Future<void> _generatePuzzle() async {
    var puzzleOptions = PuzzleOptions(patternName: "winter");
    var puzzle = Puzzle(puzzleOptions);
    await puzzle.generate();
    setState(() {
      _matrix = puzzle
          .board()
          ?.matrix()
          ?.map((row) => row.map((cell) => cell.getValue() ?? 0).toList())
          .toList();
      _expectedMatrix = puzzle
          .solvedBoard()
          ?.matrix()
          ?.map((row) => row.map((cell) => cell.getValue() ?? 0).toList())
          .toList();
    });
  }

  void _onCellTap(int boxIndex, int cellIndex) {
    setState(() {
      _selectedBoxIndex = boxIndex;
      _selectedCellIndex = cellIndex;
    });
  }

  void _setValue(int value) {
    if (_selectedBoxIndex != null && _selectedCellIndex != null) {
      int expectedValue = _expectedMatrix![_selectedBoxIndex!][_selectedCellIndex!];
      if (value == expectedValue) {
        setState(() {
          _matrix![_selectedBoxIndex!][_selectedCellIndex!] = value;
        });
      } else {
        final snackBar = SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Erreur',
            message: 'La valeur saisie n\'est pas correcte.',
            contentType: ContentType.failure,
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();
    if (_matrix == null || _expectedMatrix == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height,
                width: height,
                child: Board(
                  boxSize: boxSize / 3,
                  values: _matrix!,
                  expectedValues: _expectedMatrix!,
                  onCellTap: _onCellTap,
                  selectedBoxIndex: _selectedBoxIndex,
                  selectedCellIndex: _selectedCellIndex,
                ),
              ),
              KeyBoard(onKeyPressed: _setValue),
            ],
          ),
        ),
      ),
    );
  }
}