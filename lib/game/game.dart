import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Game extends StatelessWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

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
        child: SizedBox(
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
