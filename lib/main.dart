import 'package:flutter/material.dart';
import 'package:my_wallet/screens/budget_page.dart';
import 'package:my_wallet/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Wallet",
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: ((context) => HomePage()),
        BudgetPage.id: ((context) => BudgetPage())
      },
    );
  }
}
