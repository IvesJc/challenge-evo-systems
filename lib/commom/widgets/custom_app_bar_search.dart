import 'package:flutter/material.dart';
import 'package:challenge_evo_systems/commom/constants/app_colors.dart';

class CustomAppBarWithSearchIcon extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearchPressed; // Callback para o ícone de pesquisa

  @override
  final Size preferredSize;

  const CustomAppBarWithSearchIcon({
    super.key,
    required this.onSearchPressed, // Recebe o callback como argumento
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

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
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: AppColors.white),
          onPressed: onSearchPressed, // Chama o callback ao pressionar
        ),
      ],
    );
  }
}
