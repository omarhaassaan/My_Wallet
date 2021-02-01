import 'package:flutter/material.dart';
import 'package:my_wallet/local_storage.dart';

const double cIconSize = 50;
const double cMediumSize = 20;
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
