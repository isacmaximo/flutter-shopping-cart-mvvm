import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/checkout_repository.dart';

class DoCheckoutUseCase {
  final CheckoutRepository _checkoutRepository;
  final CartRepository _cartRepository;

  DoCheckoutUseCase(this._checkoutRepository, this._cartRepository);

  Future<bool> call(CartEntity cart) async {
    if (cart.isEmpty) {
      throw FlutterError('Carrinho está vazio');
    }

    try {
      final cartDto = CartDto.fromEntity(cart);
      final success = await _checkoutRepository.checkout(cartDto);

      if (success) {
        cart.clear();
        await _cartRepository.updateCart(cart);
        return true;
      } else {
        throw FlutterError('Falha no checkout');
      }
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }
}
