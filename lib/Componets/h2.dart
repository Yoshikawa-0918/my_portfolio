import 'package:flutter/material.dart';

class HeadLine2 extends StatelessWidget {
  final String text;
  final Color? color;
  const HeadLine2({super.key, required this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: color,
          ),
        ),
      ),
    );
  }
}
