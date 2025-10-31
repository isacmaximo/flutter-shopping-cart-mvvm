import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';

class CartEntity {
  static const int maxDifferentProducts = 10;

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

  int get differentProductsCount => items?.length ?? 0;

  bool containsProduct(ProductEntity product) {
    if (items == null) return false;

    for (CartItemEntity item in items!) {
      if (item.product?.id == product.id) {
        return true;
      }
    }
    return false;
  }

  /// Encontra um item específico no carrinho
  CartItemEntity? findItem(ProductEntity product) {
    if (items == null) return null;

    for (CartItemEntity item in items!) {
      if (item.product?.id == product.id) {
        return item;
      }
    }
    return null;
  }

  void addProduct(ProductEntity product, {int quantity = 1}) {
    //Se for null = [], se não, não faça nada
    items ??= [];

    CartItemEntity? existingItem;
    for (CartItemEntity item in items!) {
      if (item.product?.id == product.id) {
        existingItem = item;
        break;
      }
    }

    if (existingItem != null) {
      existingItem.quantity = (existingItem.quantity ?? 0) + quantity;
    } else {
      //se o produto é novo
      if (differentProductsCount >= maxDifferentProducts) {
        throw FlutterError(
          'Limite de $maxDifferentProducts produtos diferentes atingido',
        );
      }

      items!.add(CartItemEntity(product: product, quantity: quantity));
    }
  }

  void removeProduct(ProductEntity product, {int quantity = 1}) {
    if (items == null || items!.isEmpty) {
      throw FlutterError('Carrinho está vazio');
    }

    CartItemEntity? existingItem;
    int itemIndex = -1;

    for (int i = 0; i < items!.length; i++) {
      if (items![i].product?.id == product.id) {
        existingItem = items![i];
        itemIndex = i;
        break;
      }
    }

    if (existingItem == null) {
      throw FlutterError('Produto não encontrado no carrinho');
    }

    final currentQuantity = existingItem.quantity ?? 0;

    if (currentQuantity <= quantity) {
      items!.removeAt(itemIndex);

      if (items!.isEmpty) {
        throw FlutterError('Erro ao remover último item do carrinho');
      }
    } else {
      existingItem.quantity = currentQuantity - quantity;
    }
  }

  int getCurrentItemQuantity(ProductEntity product) {
    if (items == null) return 0;
    for (CartItemEntity item in items!) {
      if (item.product?.id == product.id) {
        return item.quantity ?? 0;
      }
    }
    return 0;
  }

  bool get isEmpty => items?.isEmpty ?? true;

  void clear() {
    if (items != null) {
      items!.clear();
    }
  }
}
