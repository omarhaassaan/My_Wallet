import 'package:flutter/material.dart';
import 'package:my_wallet/screens/budget_page.dart';
import 'package:my_wallet/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_wallet/screens/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Wallet",
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.indigo, primaryColor: Colors.red),
      initialRoute: RegisterPage.id,
      routes: {
        RegisterPage.id: ((context) => RegisterPage()),
        HomePage.id: ((context) => HomePage()),
        BudgetPage.id: ((context) => BudgetPage())
      },
    );
  }
}
