import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<void> call(CartEntity cart) async {
    await _cartRepository.updateCart(cart);
  }
}
