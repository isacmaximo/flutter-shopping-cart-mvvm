import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_item_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/store/cart_store.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/product/get_product_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/dialog/custom_info_dialog.dart';
import 'package:flutter_shopping_cart_mvvm/utils/enums/view_states.dart';

class ProductsViewModel extends ChangeNotifier {
  final CartStore _cartStore;
  final GetProductUseCase _getProductUseCase;

  ProductsViewModel(this._cartStore, this._getProductUseCase) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInitData();
    });
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  List<ProductEntity> _products = [];
  List<ProductEntity> get products => _products;
  void setProducts(List<ProductEntity> value) {
    _products = value;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      setViewState(ViewState.loading);
      await _getProductUseCase().then((List<ProductEntity> productsLoaded) {
        setProducts(productsLoaded);
      });
      setViewState(ViewState.value);
    } catch (e) {
      setErrorMessage(_cartStore.errorMessage);
      setViewState(ViewState.error);
    }
  }

  CartEntity get cart => _cartStore.cart;

  ViewState _viewState = ViewState.loading;
  ViewState get viewState => _viewState;

  void setViewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  Future<void> getInitData() async {
    await getProducts();
  }

  int get quantity => _cartStore.quantity;

  void addToCart(ProductEntity product, BuildContext context) {
    try {
      _cartStore.addToCartLocal(product);
      setViewState(ViewState.value);
    } on FlutterError catch (e) {
      setErrorMessage('Erro ao adicionar ao carrinho.');
      showDialog(
        context: context,
        builder: (context) =>
            CustomInfoDialog(title: errorMessage, message: e.toString()),
      );
    }
  }

  void removeFromCart(ProductEntity product, BuildContext context) {
    try {
      _cartStore.removeFromCartLocal(
        CartItemEntity(product: product, quantity: 1),
      );
      setViewState(ViewState.value);
    } on FlutterError catch (e) {
      setErrorMessage('Erro ao remover do carrinho.');
      showDialog(
        context: context,
        builder: (context) =>
            CustomInfoDialog(title: errorMessage, message: e.toString()),
      );
    }
  }

  int getCurrentItemQuantity(ProductEntity product) {
    return _cartStore.getCurrentItemQuantity(product);
  }
}
