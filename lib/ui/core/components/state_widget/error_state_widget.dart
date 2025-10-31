import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  final String titleButton;
  final VoidCallback onPressButton;
  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
    required this.titleButton,
    required this.onPressButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(errorMessage, style: TextStyles.mediumLightError),
          const SizedBox(height: defaultHeightSpace),
          ElevatedButton(onPressed: onPressButton, child: Text(titleButton)),
        ],
      ),
    );
  }
}
