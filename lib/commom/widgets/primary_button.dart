import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final VoidCallback? onPressed; 
  final String text;

  const PrimaryButton({
    super.key, this.onPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(38)),
      child: Ink(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(38)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.redGradientColors,
            )),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(38)),
          onTap: onPressed,
          child: Container(
            height: 60,
            width: 350,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(38)),
            ),
            child: Text(text,
                style: AppTextStyles.smallTextWhite
                    .copyWith(color: AppColors.white)),
          ),
        ),
      ),
    );
  }
}
