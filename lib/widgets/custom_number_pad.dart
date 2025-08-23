// custom_number_pad.dart
import 'package:flutter/material.dart';

class CustomNumberPad extends StatelessWidget {
  final Function(String) onKeyTap;

  const CustomNumberPad({super.key, required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    // Helper method to create a glowing circular button.
    Widget glowingButton(
        {required Widget child, required VoidCallback onPressed}) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(255, 0, 170, 0.6),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.black,
            foregroundColor: const Color.fromARGB(255, 255, 0, 170),
            padding: const EdgeInsets.all(20),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    }

    /// Helper method to build a button for a given key label.
    Widget buildKey(String keyText) {
      return glowingButton(
        onPressed: () => onKeyTap(keyText),
        child: Text(keyText, style: const TextStyle(fontSize: 24)),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // First row: 1 2 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('1'),
            buildKey('2'),
            buildKey('3'),
          ],
        ),
        const SizedBox(height: 10),
        // Second row: 4 5 6
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('4'),
            buildKey('5'),
            buildKey('6'),
          ],
        ),
        const SizedBox(height: 10),
        // Third row: 7 8 9
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('7'),
            buildKey('8'),
            buildKey('9'),
          ],
        ),
        const SizedBox(height: 10),
        // Fourth row: Clear, 0, Back
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            glowingButton(
              onPressed: () => onKeyTap('clear'),
              child: const Text('C', style: TextStyle(fontSize: 24)),
            ),
            buildKey('0'),
            glowingButton(
              onPressed: () => onKeyTap('back'),
              child: const Icon(Icons.backspace,
                  size: 24, color: Color.fromARGB(255, 255, 0, 170)),
            ),
          ],
        ),
      ],
    );
  }
}
