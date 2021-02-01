import 'package:flutter/material.dart';
import 'package:my_wallet/components/my_button.dart';
import 'package:my_wallet/components/payment.dart';
import 'package:my_wallet/my_budget.dart';
import 'package:my_wallet/components/my_column.dart';
import 'package:my_wallet/constants.dart';
import 'package:my_wallet/components/text_field.dart';
import 'package:my_wallet/screens/payments_page.dart';

class BudgetPage extends StatefulWidget {
  static String id = "budgetpage";
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final MyBudget budget = MyBudget.instance;
  double amount;
  String paymentName;
  List<Payment> payments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyColumn(
        children: [
          Text(
            'Current Budget: ${budget.currency} ${budget.currentBudget}',
            style: cScreenText,
          ),
          MyTextField(
            function: (value) {
              this.paymentName = value;
            },
            hint: 'Name of the payment',
          ),
          MyTextField(
            function: (value) {
              // Check if the input text is double or not
              try {
                this.amount = double.parse(value);
                print(amount);
              } catch (e) {
                print(e.toString());
              }
            },
            hint: 'Amount',
            inputType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                text: 'Add\nPayment',
                function: () {
                  // Add the payment to the payments list
                  this.payments.add(Payment(
                        amount: this.amount,
                        name: this.paymentName,
                      ));
                },
              ),
              MyButton(
                text: 'View \nPayments',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentsPage(
                        payments: this.payments,
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
