import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/buttons/control_quantity_button.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';
import 'package:flutter_shopping_cart_mvvm/utils/price/price_utils.dart';

class CartCard extends StatelessWidget {
  final CartItemEntity cartItem;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  final int itemQuantity;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.onAddToCart,
    required this.onRemoveFromCart,
    required this.itemQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(defaultCardPadding),
        child: Column(
          children: [
            if (cartItem.product?.image != null)
              Image.network(
                cartItem.product?.image ?? '',
                height: 200,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            const SizedBox(height: defaultHeightSpace),
            Text(
              cartItem.product?.title ?? '-',
              textAlign: TextAlign.center,
              style: TextStyles.mediumLight,
            ),
            const SizedBox(height: defaultHeightSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Preço Unitário:',
                    style: TextStyles.mediumRegular,
                  ),
                ),
                Flexible(
                  child: Text(
                    PriceUtils.formatPrice(cartItem.product?.price ?? 0.0),
                    style: TextStyles.mediumRegular,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text('Valor Total:', style: TextStyles.mediumRegular),
                ),
                Flexible(
                  child: Text(
                    PriceUtils.formatPrice(
                      (cartItem.product?.price ?? 0.0) * itemQuantity,
                    ),
                    style: TextStyles.largeRegularPrice,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultHeightSpace),
            ControlQuantityButton(
              itemQuantity: itemQuantity,
              onAdd: onAddToCart,
              onRemove: onRemoveFromCart,
            ),
          ],
        ),
      ),
    );
  }
}
