import 'package:flutter_shopping_cart_mvvm/data/models/dto/product_dto.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/product_repository.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/products_api.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/product_entity.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsApi _productsApi;

  ProductRepositoryImpl(this._productsApi);

  @override
  Future<List<ProductEntity>> getProducts() async {
    List<ProductDto> productDtos = await _productsApi.getProducts();
    return productDtos.map((productDto) => productDto.toEntity()).toList();
  }
}
