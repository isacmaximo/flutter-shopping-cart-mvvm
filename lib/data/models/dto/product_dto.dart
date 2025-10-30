import 'dart:convert';

import 'package:flutter_shopping_cart_mvvm/data/models/dto/rating_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';

class ProductDto {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;
  RatingDto? rating;

  ProductDto({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
      'rating': rating?.toMap(),
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      category: map['category'] != null ? map['category'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      image: map['image'] != null ? map['image'] as String : null,
      rating: map['rating'] != null
          ? RatingDto.fromMap(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) =>
      ProductDto.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      category: category,
    );
  }

  factory ProductDto.fromEntity(ProductEntity product) => ProductDto(
    id: product.id,
    title: product.title,
    price: product.price,
    category: product.category,
  );
}
