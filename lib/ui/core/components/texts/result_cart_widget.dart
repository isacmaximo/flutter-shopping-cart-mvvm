import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/price/price_utils.dart';

class ResultCartWidget extends StatelessWidget {
  final CartEntity cart;
  const ResultCartWidget({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('Frete:', style: TextStyles.mediumRegular)),
            Flexible(
              child: Text(
                PriceUtils.formatPrice(cart.shippingPriceValue),
                style: TextStyles.mediumRegular,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('Subtotal:', style: TextStyles.mediumRegular)),
            Flexible(
              child: Text(
                PriceUtils.formatPrice(cart.subtotalPrice),
                style: TextStyles.mediumRegular,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('Total:', style: TextStyles.largeRegular)),
            Flexible(
              child: Text(
                PriceUtils.formatPrice(cart.totalPrice),
                style: TextStyles.largeRegularPrice,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
