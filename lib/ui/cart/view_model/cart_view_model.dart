import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/store/cart_store.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/checkout/do_checkout_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/utils/enums/view_states.dart';

class CartViewModel extends ChangeNotifier {
  final CartStore _cartStore;
  final DoCheckoutUseCase _doCheckoutUseCase;

  CartViewModel(this._cartStore, this._doCheckoutUseCase) {
    initPage();
  }

  CartEntity get cart => _cartStore.cart;
  List<CartItemEntity> get items => cart.items ?? [];

  ViewState _viewState = ViewState.loading;
  ViewState get viewState => _viewState;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void setViewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    setViewState(ViewState.error);
  }

  void clearError() {
    _errorMessage = '';
    setViewState(ViewState.value);
  }

  void initPage() {
    clearError();
  }

  void addToCart(ProductEntity product) {
    try {
      _cartStore.addToCartLocal(product);
      clearError();
    } on FlutterError catch (e) {
      setErrorMessage(e.message);
    }
  }

  void removeFromCart(ProductEntity product) {
    try {
      _cartStore.removeFromCartLocal(product);
      clearError();
    } on FlutterError catch (e) {
      setErrorMessage(e.message);
    }
  }

  Future<void> updateCartAndGet() async {
    try {
      setViewState(ViewState.loading);
      await _cartStore.updateCartApi().whenComplete(
        () async => await _cartStore.getCartApi(),
      );
      setViewState(ViewState.value);
      clearError();
    } on FlutterError catch (e) {
      setErrorMessage(e.message);
      setViewState(ViewState.error);
    }
  }

  bool sameCart(CartEntity cart1, CartEntity cart2) {
    if (cart1.userId != cart2.userId) {
      return false;
    }
    if (cart1.items?.length != cart2.items?.length) {
      return false;
    }
    for (var item1 in cart1.items ?? []) {
      bool found = false;
      for (var item2 in cart2.items ?? []) {
        if (item1.product.id == item2.product.id &&
            item1.quantity == item2.quantity) {
          found = true;
          break;
        }
      }
      if (!found) {
        return false;
      }
    }
    return true;
  }

  Future<CartEntity?> checkoutAndClearCart() async {
    CartEntity? cartToCompareOnSave = _cartStore.cart;
    await updateCartAndGet();
    if (!sameCart(cartToCompareOnSave, _cartStore.cart)) {
      setErrorMessage(
        'Problema ao finalizar compra, carrinho foi alterado duarante o processo',
      );
      return null;
    }

    try {
      setViewState(ViewState.loading);

      final cartCopy = CartEntity(
        userId: cart.userId,
        items: cart.items
            ?.map(
              (item) => CartItemEntity(
                product: item.product,
                quantity: item.quantity,
              ),
            )
            .toList(),
      );

      final success = await _doCheckoutUseCase.call(cart);
      if (success) {
        setViewState(ViewState.value);
        return cartCopy;
      }
      return null;
    } on FlutterError catch (e) {
      setErrorMessage(e.message);
      return null;
    }
  }
}
