import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/data/http/custom_http_client.dart';
import 'package:flutter_shopping_cart_mvvm/data/models/dto/product_dto.dart';
import 'package:flutter_shopping_cart_mvvm/utils/api.dart';

class ProductsApi {
  final CustomHttpClient _httpClient;
  final String _baseUrl = '$api/products';

  ProductsApi(this._httpClient);

  Future<List<ProductDto>> getProducts() async {
    try {
      Response response = await _httpClient.get(_baseUrl);
      return response.data.map((json) => ProductDto.fromMap(json)).toList();
    } on DioException catch (e) {
      throw FlutterError('Erro ao obter produtos: ${e.message}');
    }
  }
}
