import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';

class UpdateCartUseCase {
  final CartRepository _cartRepository;

  UpdateCartUseCase(this._cartRepository);

  Future<void> call(CartEntity cart) async {
    await _cartRepository.updateCart(cart);
  }
}
