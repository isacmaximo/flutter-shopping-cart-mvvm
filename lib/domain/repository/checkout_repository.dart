import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';

abstract class CheckoutRepository {
  Future<bool> checkout(CartDto cart);
}
