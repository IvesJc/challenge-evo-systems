import 'package:challenge_evo_systems/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          surface: Colors.black,
          onSurface: Colors.white,
          primary: Colors.redAccent,
          onPrimary: Colors.white
        )
      ),
      home: HomePage(),
    );
  }
}

