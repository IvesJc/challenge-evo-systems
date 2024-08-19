import 'package:challenge_evo_systems/screens/all_movies_screen.dart';
import 'package:challenge_evo_systems/screens/home/home_screen.dart';
import 'package:challenge_evo_systems/screens/test.dart';
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
      home: MoviePage(),
    );
  }
}
