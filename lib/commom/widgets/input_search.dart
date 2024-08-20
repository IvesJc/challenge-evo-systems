// lib/widgets/search_movie_field.dart
import 'package:flutter/material.dart';
import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const InputSearch({
    Key? key,
    required this.controller,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Pesquisar filme',
        labelStyle: AppTextStyles.minTextWhite,
        suffixIcon: IconButton(
          icon: Icon(Icons.search, color: AppColors.white),
          onPressed: onSearch,
        ),
      ),
      keyboardType: TextInputType.text,
      style: AppTextStyles.minTextWhite,
    );
  }
}
