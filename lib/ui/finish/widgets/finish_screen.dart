import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/base/base_page.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/cards/finished_card.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/state_widget/error_state_widget.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/texts/result_cart_widget.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';
import 'package:flutter_shopping_cart_mvvm/utils/enums/view_states.dart';

class FinishScreen extends StatelessWidget {
  final CartEntity cart;
  const FinishScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Pedido Finalizado',
      quantity: 0,
      viewState: ViewState.value,
      disableCartAction: true,
      canShowExitDialog: true,
      loadedWidget: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items?.length ?? 0,
              itemBuilder: (context, index) {
                final item = cart.items?[index];
                return FinishedCard(cartItem: item!);
              },
            ),
          ),
          SizedBox(height: defaultHeightSpace),
          ResultCartWidget(cart: cart),
          SizedBox(height: defaultHeightSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              child: const Text('Novo Pedido'),
            ),
          ),
        ],
      ),
      errorWidget: ErrorStateWidget(
        errorMessage: 'Erro ao carregar os itens do pedido',
        titleButton: 'Voltar para o início',
        onPressButton: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    );
  }
}
