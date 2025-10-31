import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/cart/view_model/cart_view_model.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/base/base_page.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/cards/cart_card.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/state_widget/error_state_widget.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/texts/result_cart_widget.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  final CartViewModel cartViewModel;

  const CartScreen({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cartViewModel,
      builder: (context, child) {
        return BasePage(
          quantity: cartViewModel.cart.differentProductsCount,
          viewState: cartViewModel.viewState,
          disableCartAction: true,
          title: 'Resumo do Carrinho',
          loadedWidget: _buildProductList(context, cartViewModel.items),
          errorWidget: ErrorStateWidget(
            errorMessage: cartViewModel.errorMessage,
            titleButton: 'Voltar para o início',
            onPressButton: () {
              cartViewModel.clearError();
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  Widget _buildProductList(BuildContext context, List<CartItemEntity> items) {
    return Column(
      children: items.isNotEmpty
          ? [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartCard(
                      cartItem: item,
                      itemQuantity: cartViewModel.cart.getCurrentItemQuantity(
                        item.product!,
                      ),
                      onAddToCart: () {
                        cartViewModel.addToCart(item.product!);
                      },
                      onRemoveFromCart: () {
                        cartViewModel.removeFromCart(item.product!);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: defaultHeightSpace),
              Divider(height: 1),
              SizedBox(height: defaultHeightSpace),
              ResultCartWidget(cart: cartViewModel.cart),
              SizedBox(height: defaultHeightSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final cartCopy = await cartViewModel.checkoutAndClearCart();
                    if (cartCopy != null && context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/finish',
                        (route) => false,
                        arguments: cartCopy,
                      );
                    }
                  },
                  child: Text('Finalizar'),
                ),
              ),
            ]
          : [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Nenhum produto encontrado.',
                      style: TextStyles.mediumLight,
                    ),
                    Text(
                      'Adicione produtos ao carrinho para continuar.',
                      style: TextStyles.mediumLight,
                    ),
                  ],
                ),
              ),
            ],
    );
  }
}
