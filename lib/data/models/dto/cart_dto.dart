import 'dart:convert';
import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_item_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';

class CartDto {
  int? userId;
  List<CartItemDto>? items;

  CartDto({this.userId, this.items});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory CartDto.fromMap(Map<String, dynamic> map) {
    return CartDto(
      userId: map['userId'] != null ? map['userId'] as int : null,
      items: map['items'] != null
          ? List<CartItemDto>.from(
              (map['items'] as List<int>).map<CartItemDto?>(
                (x) => CartItemDto.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDto.fromJson(String source) =>
      CartDto.fromMap(json.decode(source) as Map<String, dynamic>);

  CartEntity toEntity() => CartEntity(
    userId: userId,
    items: items?.map((x) => x.toEntity()).toList(),
  );
}
