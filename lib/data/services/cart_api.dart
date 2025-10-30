import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/durations.dart';

class CartApi {
  static final CartDto _cartCache = CartDto(userId: 1, items: []);

  Future<CartDto> getCart() async {
    try {
      await Future.delayed(apiMockTimeout);
      return _cartCache;
    } catch (e) {
      throw FlutterError('Erro ao obter carrinho!');
    }
  }

  Future<void> updateCart(CartDto cart) async {
    try {
      await Future.delayed(apiMockTimeout);

      //Simulando erro ao atualizar carrinho
      if ((cart.items?.isEmpty ?? false)) {
        throw FlutterError('Não é possível remover o último item do carrinho.');
      }

      _cartCache.items = cart.items;
    } catch (e) {
      throw FlutterError('Erro ao atualizar carrinho!');
    }
  }
}
