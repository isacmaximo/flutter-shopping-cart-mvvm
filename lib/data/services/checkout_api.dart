//API Simudada
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/data/models/dto/cart_dto.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/durations.dart';

class CheckoutApi {
  Future<bool> checkout(CartDto cart) async {
    try {
      await Future.delayed(apiMockTimeout);

      //Simulando um sucesso na finalização da compra
      return true;
    } catch (e) {
      throw FlutterError('Erro ao finalizar compra!');
    }
  }
}
