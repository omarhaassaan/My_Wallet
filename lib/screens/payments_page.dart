import 'package:flutter/material.dart';
import 'package:my_wallet/components/payment.dart';

class PaymentsPage extends StatelessWidget {
  final List<Payment> payments;

  PaymentsPage({this.payments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: this.payments.length,
        itemBuilder: (context, index) {
          if (this.payments.length == 0) return null;
          return ListTile(
            title: Text(this.payments[index].name),
          );
        },
      ),
    );
  }
}
