import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';

class CartEntity {
  int? userId;
  List<CartItemEntity>? items;

  CartEntity({this.userId, this.items});

  double get totalPrice {
    double total = 0.0;
    for (CartItemEntity itemEntity in items ?? []) {
      double totalItemPrice = itemEntity.totalPrice;
      total += totalItemPrice;
    }
    //Frete fixo simulado
    double shipping = 10.0;
    total += shipping;
    return total;
  }

  void removeItem(CartItemEntity cartItem) {
    items?.removeWhere((item) => item.product?.id == cartItem.product?.id);
  }

  void addItem(CartItemEntity cartItem) {
    items?.add(cartItem);
  }
}
