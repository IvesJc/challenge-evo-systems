import 'package:challenge_evo_systems/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IvesFlix',
      home: SplashPage(),
    );
  }
}
