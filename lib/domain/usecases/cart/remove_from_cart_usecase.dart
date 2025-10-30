import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository _cartRepository;

  RemoveFromCartUseCase(this._cartRepository);

  Future<void> call(CartItemEntity cartItem) async {
    final cart = await _cartRepository.getCart();
    cart.removeItem(cartItem);
    await _cartRepository.saveCart(cart);
  }
}
