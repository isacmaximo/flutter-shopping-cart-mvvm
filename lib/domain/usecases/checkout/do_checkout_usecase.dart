import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/checkout_repository.dart';

class DoCheckoutUsecase {
  final CheckoutRepository _checkoutRepository;

  DoCheckoutUsecase(this._checkoutRepository);

  Future<bool> call(CartDto cart) async {
    return await _checkoutRepository.checkout(cart);
  }
}
