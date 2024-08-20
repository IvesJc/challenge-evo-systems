import 'package:flutter/material.dart';
import 'package:challenge_evo_systems/commom/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColorDark,
      elevation: 0,
      title: Image.asset(
        'assets/images/ivesflix.png',
        fit: BoxFit.cover,
        height: 40,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
