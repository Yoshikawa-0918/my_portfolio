import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopicBody extends StatelessWidget {
  List<Widget> children = const <Widget>[];
  Color? background = Colors.white;
  TopicBody({super.key, required this.children, this.background});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      constraints: BoxConstraints(minHeight: size.height),
      color: background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
