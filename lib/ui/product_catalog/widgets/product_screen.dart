import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/base/base_page.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/cards/product_card.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/ui/product_catalog/view_model/products_view_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductsViewModel productsViewModel;

  const ProductScreen({super.key, required this.productsViewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: productsViewModel,
      builder: (context, child) {
        return BasePage(
          quantity: productsViewModel.quantity,
          viewState: productsViewModel.viewState,
          title: 'Catálogo de Produtos',
          loadedWidget: _buildProductList(productsViewModel.products),
          errorWidget: Center(
            child: Text(
              'Error: ${productsViewModel.errorMessage}',
              style: TextStyles.mediumLightError,
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductList(List<ProductEntity> products) {
    return Column(
      children: [
        if (products.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  itemQuantity: productsViewModel.getCurrentItemQuantity(
                    product,
                  ),
                  onAddToCart: () =>
                      productsViewModel.addToCart(product, context),
                  onRemoveFromCart: () =>
                      productsViewModel.removeFromCart(product, context),
                );
              },
            ),
          ),
        if (products.isEmpty)
          Text('Nenhum produto encontrado.', style: TextStyles.mediumLight),
      ],
    );
  }
}
