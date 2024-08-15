import 'package:challenge_evo_systems/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingPage(),
    );
  }
}