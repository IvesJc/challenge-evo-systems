// lib/widgets/page_number_input.dart
import 'package:flutter/material.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';

class PageNumberInput extends StatelessWidget {
  final TextEditingController pageController;
  final ValueChanged<int> onPageChanged;

  const PageNumberInput({
    Key? key,
    required this.pageController,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            controller: pageController,
            decoration: InputDecoration(
              labelText: 'Page Number',
              labelStyle: AppTextStyles.minTextWhite,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  onPageChanged(int.tryParse(pageController.text) ?? 1);
                },
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTextStyles.minTextWhite,
          ),
        ),
      ),
    );
  }
}
