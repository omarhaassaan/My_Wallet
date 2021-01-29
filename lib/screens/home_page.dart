import 'package:flutter/material.dart';
import 'package:my_wallet/components/my_column.dart';
import 'package:my_wallet/components/rounded_button.dart';
import 'package:my_wallet/components/text_field.dart';
import 'package:my_wallet/constants.dart';
import 'package:my_wallet/my_budget.dart';
import 'package:my_wallet/screens/budget_page.dart';

class HomePage extends StatefulWidget {
  static String id = "homepage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyBudget budget = MyBudget.instance;
  double amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
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
                  function: () {
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
