import 'package:flutter/material.dart';
import 'package:my_wallet/constants.dart';

class Payment extends StatelessWidget {
  final String name;
  final double amount;

  Payment({this.name, this.amount});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blue,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  this.name,
                  style: TextStyle(
                    fontSize: cMediumSize,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  this.amount.toString(),
                  style: TextStyle(
                    fontSize: cMediumSize,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
