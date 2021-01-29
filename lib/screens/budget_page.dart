import 'package:flutter/material.dart';
import 'package:my_wallet/my_budget.dart';

class BudgetPage extends StatefulWidget {
  static String id = "budgetpage";
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final MyBudget budget = MyBudget.instance;
  double amount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('Budget Page ${this.budget.currentBudget}'),
      ),
    );
  }
}
