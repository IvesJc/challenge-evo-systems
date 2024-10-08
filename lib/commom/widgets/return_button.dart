import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColorDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }
}
