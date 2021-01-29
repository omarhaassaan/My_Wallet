import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final List<Widget> children;
  MyColumn({this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.children,
      ),
    );
  }
}
