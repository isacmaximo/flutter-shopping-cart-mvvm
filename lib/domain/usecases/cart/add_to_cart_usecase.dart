import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<void> call(CartEntity cart, CartItemEntity newItem) async {
    if ((cart.items?.length ?? 0) >= 10) {
      throw FlutterError('Limite de 10 produtos diferentes atingido');
    }

    cart.items?.add(newItem);

    await _cartRepository.saveCart(cart);
  }
}
