import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> getCart();
  Future<void> updateCart(CartEntity cart);
}
