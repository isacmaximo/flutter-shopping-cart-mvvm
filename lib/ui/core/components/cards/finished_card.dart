import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';
import 'package:flutter_shopping_cart_mvvm/utils/price/price_utils.dart';

class FinishedCard extends StatelessWidget {
  final CartItemEntity cartItem;

  const FinishedCard({super.key, required this.cartItem});

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
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            const SizedBox(height: defaultHeightSpace),
            Column(children: []),
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
                  child: Text('Quantidade:', style: TextStyles.mediumRegular),
                ),
                Flexible(
                  child: Text(
                    'x ${cartItem.quantity?.toString() ?? '-'}',
                    style: TextStyles.mediumRegular,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text('Valor Total:', style: TextStyles.mediumRegular),
                ),
                Flexible(
                  child: Text(
                    PriceUtils.formatPrice(
                      (cartItem.product?.price ?? 0.0) * cartItem.quantity!,
                    ),
                    style: TextStyles.mediumRegular,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
