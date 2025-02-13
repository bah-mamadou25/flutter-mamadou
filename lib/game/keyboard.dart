import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  final void Function(int) onKeyPressed;

  const KeyBoard({Key? key, required this.onKeyPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            int value = index + 1;
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => onKeyPressed(value),
                  child: Text(value.toString()),
                ),
              ),
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            int value = index + 6;
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => onKeyPressed(value),
                  child: Text(value.toString()),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
