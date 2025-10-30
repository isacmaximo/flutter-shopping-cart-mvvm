import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';

class CartItemEntity {
  ProductEntity? product;
  int? quantity;

  CartItemEntity({this.product, this.quantity});

  double get totalPrice => (product?.price ?? 0) * (quantity ?? 0);
}
