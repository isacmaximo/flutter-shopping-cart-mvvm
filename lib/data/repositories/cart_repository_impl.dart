import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/cart_api.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApi _cartApi;

  CartRepositoryImpl(this._cartApi);

  @override
  Future<CartEntity> getCart() async {
    CartDto cartDto = await _cartApi.getCart();
    return cartDto.toEntity();
  }

  @override
  Future<void> saveCart(CartEntity cart) async {
    CartDto cartDto = CartDto.fromEntity(cart);
    await _cartApi.updateCart(cartDto);
  }
}
