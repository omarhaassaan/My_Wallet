import 'package:flutter/material.dart';
import 'package:my_wallet/constants.dart';

class MyTextField extends StatelessWidget {
  final Function function;
  MyTextField({this.function});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: cScreenText,
      textAlign: TextAlign.center,
      decoration: cTextFieldDeco,
      onChanged: function,
    );
  }
}
