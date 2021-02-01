import 'package:flutter/material.dart';
import 'package:my_wallet/components/my_button.dart';
import 'package:my_wallet/components/payment.dart';
import 'package:my_wallet/my_budget.dart';
import 'package:my_wallet/components/my_column.dart';
import 'package:my_wallet/constants.dart';
import 'package:my_wallet/components/text_field.dart';
import 'package:my_wallet/screens/payments_page.dart';
import 'package:my_wallet/local_storage.dart';

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

  void updateFromDB() async {
    // Read names from db
    final List<String> names = await LocalStorage.readStrings(paymentNamesKey);
    // Read amounts from db
    final List<String> amounts =
        await LocalStorage.readStrings(paymentAmountsKey);
    // Update current payments by its name and its amount
    for (int i = 0; i < names.length; i++)
      this
          .payments
          .add(Payment(name: names[i], amount: double.parse(amounts[i])));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.updateFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Budget'),
            MaterialButton(
              onPressed: () {
                setState(() {
                  LocalStorage.resetStorage();
                });
              },
              child: Text('RESET'),
              color: Colors.lightBlue,
              shape: RoundedBorder,
            )
          ],
        ),
      ),
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
                this.amount = null;
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
                function: () async {
                  // Add the payment to the payments list
                  if (this.paymentName.isNotEmpty && this.amount != null) {
                    this.payments.add(
                          Payment(
                            amount: this.amount,
                            name: this.paymentName,
                          ),
                        );
                    // Store the names of the payments
                    List<String> list =
                        await LocalStorage.readStrings(paymentNamesKey) ?? [];
                    list.add(this.paymentName);
                    LocalStorage.writeStrings(paymentNamesKey, list);
                    list = await LocalStorage.readStrings(paymentNamesKey);
                    print("Printing Names");
                    list.forEach((e) => print(e));
                    // Store the amounts of the payments
                    list =
                        await LocalStorage.readStrings(paymentAmountsKey) ?? [];
                    list.add(this.amount.toString());
                    LocalStorage.writeStrings(paymentAmountsKey, list);
                    list = await LocalStorage.readStrings(paymentAmountsKey);
                    print("Printing Amounts");
                    list.forEach((e) => print(e));
                    setState(() {
                      this.budget.subtractAmount(this.amount);
                    });
                  }
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
                        budgetAfterPayments: this.budget.currentBudget,
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
