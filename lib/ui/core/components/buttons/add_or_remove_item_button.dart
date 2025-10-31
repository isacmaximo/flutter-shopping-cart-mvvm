import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/buttons/control_quantity_button.dart';

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
    return itemQuantity == 0
        ? SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAdd,
              child: const Text('Adicionar ao Carrinho'),
            ),
          )
        : ControlQuantityButton(
            itemQuantity: itemQuantity,
            onAdd: onAdd,
            onRemove: onRemove,
          );
  }
}
