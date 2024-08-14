import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.gradientColors)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image(image: AssetImage('assets/images/ivesflix.png')),
              ),
            ),

            const SizedBox(height: 500),
            Center(
              child: const Image(image: AssetImage('assets/images/bg-netflix.jpg')),
            ),
            const SizedBox(height: 100),
            Text(
              'Watch movies and TV shows',
              style: AppTextStyles.mediumTextWhite,
            ),
            Text('will never be the same',
                style: AppTextStyles.mediumTextWhite),
            const SizedBox(height: 50),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 25),
              ),
              onPressed: () {
                EdgeInsets.symmetric(horizontal: 80, vertical: 30);
              },
              child: Text('Get Started', style: AppTextStyles.smallTextWhite),
            ),
            const SizedBox(height: 20),
            Text('Already have an account? Login',
                style: AppTextStyles.minTextWhite),
          ],
        ),
      ),
    );
  }
}
