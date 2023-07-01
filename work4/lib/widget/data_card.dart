import 'package:flutter/material.dart';

class Datacard extends StatelessWidget {
  final List<Widget> children;
  final alignVertical;
  final bgColor;
  final verticalPadding;
  final horizontalPadding;

  const Datacard({Key? key, required
    this.children,
    this.alignVertical = false,
    this.bgColor = Colors.white,
    this.verticalPadding = 16.0,
    this.horizontalPadding = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding),
      decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: alignVertical
        ? Column(
        children: children,
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}
