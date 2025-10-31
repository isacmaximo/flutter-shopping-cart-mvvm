import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/buttons/add_or_remove_item_button.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';
import 'package:flutter_shopping_cart_mvvm/utils/price/price_utils.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  final int itemQuantity;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onRemoveFromCart,
    required this.itemQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(defaultCardPadding),
          child: Column(
            children: [
              if (product.image != null)
                Image.network(
                  product.image ?? '',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fitWidth,
                ),
              const SizedBox(height: 20),
              Text(
                product.title ?? '-',
                textAlign: TextAlign.center,
                style: TextStyles.mediumLight,
              ),
              const SizedBox(height: 20),
              Text(
                PriceUtils.formatPrice(product.price ?? 0.0),
                style: TextStyles.largeRegularPrice,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: AddOrRemoveItemButton(
                  onAdd: onAddToCart,
                  onRemove: onRemoveFromCart,
                  itemQuantity: itemQuantity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
