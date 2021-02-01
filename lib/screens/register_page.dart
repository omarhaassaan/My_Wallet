import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_wallet/screens/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterPage extends StatefulWidget {
  static String id = "registerpage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void signInAnony() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null)
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
    // As the error without the Future.delayed function is that the stack of the
    // navigator is being manipulated, so the navigator pushnamed should be
    // delayed somehow for the navigator stack to finish its job
    Future.delayed(Duration.zero, () {
      Navigator.pushNamed(context, HomePage.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInAnony();
  }

  @override
  Widget build(BuildContext context) {
//    Navigator.pushNamed(context, HomePage.id);
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
