import 'package:flutter/material.dart';
import 'package:my_wallet/components/payment.dart';
import 'package:my_wallet/constants.dart';

class PaymentsPage extends StatelessWidget {
  final List<Payment> payments;
  final double budgetAfterPayments;

  PaymentsPage({this.payments, this.budgetAfterPayments});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Payments',
                  style: cScreenText,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: this.payments.length,
                itemBuilder: (context, index) {
                  if (this.payments.length == 0) return null;
                  return ListTile(
                    title: this.payments[index],
                  );
                },
              ),
            ),
            Card(
              color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Budget:',
                      style: cScreenText,
                    ),
                    Text(
                      this.budgetAfterPayments.toString(),
                      style: cScreenText,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
