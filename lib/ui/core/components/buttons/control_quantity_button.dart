import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

class ControlQuantityButton extends StatelessWidget {
  final int itemQuantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ControlQuantityButton({
    super.key,
    required this.itemQuantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: buttonHeight,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(color: colorScheme.secondary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
            color: colorScheme.error,
          ),
          Text('$itemQuantity', style: TextStyles.mediumBold),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAdd,
            color: colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
