import 'dart:convert';

import 'package:flutter_shopping_cart_mvvm/data/models/dto/product_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';

class CartItemDto {
  ProductDto? product;
  int? quantity;

  CartItemDto({this.product, this.quantity});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'product': product?.toMap(), 'quantity': quantity};
  }

  factory CartItemDto.fromMap(Map<String, dynamic> map) {
    return CartItemDto(
      product: map['product'] != null
          ? ProductDto.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemDto.fromJson(String source) =>
      CartItemDto.fromMap(json.decode(source) as Map<String, dynamic>);

  CartItemEntity toEntity() =>
      CartItemEntity(product: product?.toEntity(), quantity: quantity);

  factory CartItemDto.fromEntity(CartItemEntity cartItem) => CartItemDto(
    product: ProductDto.fromEntity(cartItem.product!),
    quantity: cartItem.quantity,
  );
}
