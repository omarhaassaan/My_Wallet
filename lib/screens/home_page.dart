import 'package:flutter/material.dart';
import 'package:my_wallet/components/my_column.dart';
import 'package:my_wallet/components/rounded_button.dart';
import 'package:my_wallet/components/text_field.dart';
import 'package:my_wallet/constants.dart';
import 'package:my_wallet/my_budget.dart';
import 'package:my_wallet/screens/budget_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_wallet/local_storage.dart';

class HomePage extends StatefulWidget {
  static String id = "homepage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyBudget budget = MyBudget.instance;

  double amount = 0;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Update the amount if there is previous amount
    () async {
      try {
        setState(() async {
          double x = await LocalStorage.readDouble(amountKey);
          this.budget.addAmount(x);
        });
      } catch (e) {
        print("Cache is empty");
      }
    }();
  }

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
            MyRoundedButton(
              child: Icon(
                Icons.add,
                size: cIconSize,
              ),
              function: () {
                setState(() {
                  this.budget.addAmount(amount);
                });
              },
              size: cIconSize,
            ),
            MyRoundedButton(
              child: Icon(
                Icons.remove,
                size: cIconSize,
              ),
              function: () async {
                setState(() {
                  this.budget.subtractAmount(amount);
                });
              },
              size: cIconSize,
            ),
          ],
        ),
        MaterialButton(
          color: cButtonColor,
          padding: EdgeInsets.all(cIconSize),
          shape: RoundedBorder,
          onPressed: () {
            if (this.budget.currentBudget > 0)
              Navigator.pushNamed(context, BudgetPage.id);
            else
              print('Error');
          },
          child: Text(
            'Submit Budget',
            style: cScreenText,
          ),
        )
      ],
    ));
  }
}
