import 'dart:developer';

import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 2,
          child: Container(
            child: Image(
              image: AssetImage('assets/images/bg-netflix2.jpg'),
              fit: BoxFit.cover,
            ),
          )),
      Expanded(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.bgGradientColors)),
              child: Column(children: [
                const SizedBox(height: 50),
                Text(
                  'Watch movies and TV shows',
                  style: AppTextStyles.mediumTextWhite,
                ),
                Text('will never be the same',
                    style: AppTextStyles.mediumTextWhite),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 15.0),
                  child: PrimaryButton(text: 'Get Started', onPressed: () {}),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                        style: AppTextStyles.minTextWhite),
                    GestureDetector(
                      
                      onTap: () => log('message'),
                    child: Text(
                      'Login',
                      style: AppTextStyles.minTextWhiteSpan))
                  ],
                )
              ])))
    ]));
  }
}
