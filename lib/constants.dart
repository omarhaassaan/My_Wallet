import 'package:flutter/material.dart';

const double cIconSize = 50;
const Color cButtonColor = Colors.blue;

const cScreenText = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w600,
);

const cTextFieldDeco = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
  border: RoundedBorder,
);

const RoundedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
);
