import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _borderRadius,
      child: Ink(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.redGradientColors,
            )),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(text,
                style: AppTextStyles.smallTextWhite
                    .copyWith(color: AppColors.white)),
          ),
        ),
      ),
    );
  }
}
