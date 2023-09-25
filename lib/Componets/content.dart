import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  const Content({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 13,
          color: color,
        ),
      ),
    );
  }
}
