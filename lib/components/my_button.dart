import 'package:flutter/material.dart';
import 'package:my_wallet/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function function;
  MyButton({this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: cButtonColor,
      padding: EdgeInsets.all(8),
      shape: RoundedBorder,
      onPressed: this.function,
      child: Text(
        this.text,
        style: cScreenText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
