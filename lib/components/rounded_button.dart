import 'package:flutter/material.dart';
import 'package:my_wallet/constants.dart';

class MyRoundedButton extends StatelessWidget {
  final Function function;
  final Widget child;
  final double size;
  MyRoundedButton({this.function, this.child, this.size});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.function,
      child: CircleAvatar(
        backgroundColor: cButtonColor,
        radius: cIconSize,
        child: child,
      ),
    );
  }
}
