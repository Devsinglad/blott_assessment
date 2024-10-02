import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double size;

  const Spacing(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    final parentWidget = context.findAncestorWidgetOfExactType<Flex>();

    if (parentWidget is Column) {
      return SizedBox(height: size);
    } else if (parentWidget is Row) {
      return SizedBox(width: size);
    } else {
      return SizedBox(height: size, width: size);
    }
  }
}
