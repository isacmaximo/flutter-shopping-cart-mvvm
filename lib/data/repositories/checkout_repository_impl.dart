import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/checkout_api.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutApi _checkoutApi;

  CheckoutRepositoryImpl(this._checkoutApi);

  @override
  Future<bool> checkout(CartDto cart) async {
    return await _checkoutApi.checkout(cart);
  }
}
