import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroudContainer extends StatelessWidget {
  final Widget child;

  const BackgroudContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.bgGradientColors)),
      child: child,
    );
  }
}
