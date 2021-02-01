import 'package:flutter/material.dart';
import 'package:my_wallet/constants.dart';

class MyTextField extends StatelessWidget {
  final Function function;
  final String hint;
  final TextInputType inputType;
  MyTextField({this.function, this.hint, this.inputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: this.inputType,
      style: cScreenText,
      textAlign: TextAlign.center,
      decoration: cTextFieldDeco.copyWith(hintText: this.hint),
      onChanged: this.function,
    );
  }
}
