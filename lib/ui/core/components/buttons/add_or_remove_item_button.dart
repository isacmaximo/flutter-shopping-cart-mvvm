import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

class AddOrRemoveItemButton extends StatelessWidget {
  final int itemQuantity;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const AddOrRemoveItemButton({
    super.key,
    required this.itemQuantity,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return itemQuantity == 0
        ? SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAdd,
              child: const Text('Adicionar ao Carrinho'),
            ),
          )
        : Container(
            height: 48,
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
                  icon: const Icon(Icons.delete),
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
