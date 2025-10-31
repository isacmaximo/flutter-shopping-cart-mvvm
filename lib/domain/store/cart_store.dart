import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/get_cart_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/remove_from_cart_usecase.dart';

class CartStore extends ChangeNotifier {
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final GetCartUseCase _getCartUseCase;

  CartStore(
    this._addToCartUseCase,
    this._removeFromCartUseCase,
    this._getCartUseCase,
  );

  CartEntity _cart = CartEntity(userId: 1, items: []);
  CartEntity get cart => _cart;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  int get quantity => _cart.differentProductsCount;

  int getCurrentItemQuantity(ProductEntity product) {
    return _cart.getCurrentItemQuantity(product);
  }

  void setCart(CartEntity cart) {
    _cart = cart;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> getCartApi() async {
    try {
      await _getCartUseCase().then((CartEntity cartLoaded) {
        setCart(cartLoaded);
      });
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }

  void addToCartLocal(ProductEntity product) {
    try {
      _cart.addProduct(product);
      notifyListeners();
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }

  void removeFromCartLocal(ProductEntity product) {
    try {
      _cart.removeProduct(product);
      notifyListeners();
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }

  Future<void> addToCartApi() async {
    try {
      await _addToCartUseCase.call(_cart);
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }

  Future<void> removeFromCartApi() async {
    try {
      await _removeFromCartUseCase.call(cart);
    } on FlutterError catch (e) {
      throw FlutterError(e.message);
    }
  }
}
