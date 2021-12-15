import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          height: 100,
          width: 100,
          image: AssetImage("assets/images/fakestorelogo.jpg"),
        ),
      ),
    );
  }
}
