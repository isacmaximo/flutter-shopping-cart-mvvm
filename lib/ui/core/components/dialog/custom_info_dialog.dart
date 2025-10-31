import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';

class CustomInfoDialog extends StatelessWidget {
  final String title;
  final String message;

  const CustomInfoDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyles.largeBold,
        textAlign: TextAlign.center,
      ),
      content: Text(
        message,
        style: TextStyles.mediumLight,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK', style: TextStyles.mediumRegular),
        ),
      ],
    );
  }
}
