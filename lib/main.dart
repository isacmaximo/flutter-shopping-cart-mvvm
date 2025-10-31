import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/data/http/custom_http_client.dart';
import 'package:flutter_shopping_cart_mvvm/data/repositories/cart_repository_impl.dart';
import 'package:flutter_shopping_cart_mvvm/data/repositories/checkout_repository_impl.dart';
import 'package:flutter_shopping_cart_mvvm/data/repositories/product_repository_impl.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/cart_api.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/checkout_api.dart';
import 'package:flutter_shopping_cart_mvvm/data/services/products_api.dart';
import 'package:flutter_shopping_cart_mvvm/domain/entities/cart_entity.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/cart_repository.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/checkout_repository.dart';
import 'package:flutter_shopping_cart_mvvm/domain/repository/product_repository.dart';
import 'package:flutter_shopping_cart_mvvm/domain/store/cart_store.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/get_cart_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/cart/remove_from_cart_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/checkout/do_checkout_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/domain/usecases/product/get_product_usecase.dart';
import 'package:flutter_shopping_cart_mvvm/ui/cart/view_model/cart_view_model.dart';
import 'package:flutter_shopping_cart_mvvm/ui/cart/widgets/cart_screen.dart';
import 'package:flutter_shopping_cart_mvvm/ui/finish/widgets/finish_screen.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/custom_theme.dart';
import 'package:flutter_shopping_cart_mvvm/ui/product_catalog/view_model/products_view_model.dart';
import 'package:flutter_shopping_cart_mvvm/ui/product_catalog/widgets/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>(create: (context) => Dio()),
        Provider<CustomHttpClient>(
          create: (context) => CustomHttpClient(context.read<Dio>()),
        ),

        Provider<ProductsApi>(
          create: (context) => ProductsApi(context.read<CustomHttpClient>()),
        ),
        Provider<CartApi>(create: (context) => CartApi()),
        Provider<CheckoutApi>(create: (context) => CheckoutApi()),

        Provider<ProductRepository>(
          create: (context) =>
              ProductRepositoryImpl(context.read<ProductsApi>()),
        ),
        Provider<CartRepository>(
          create: (context) => CartRepositoryImpl(context.read<CartApi>()),
        ),
        Provider<CheckoutRepository>(
          create: (context) =>
              CheckoutRepositoryImpl(context.read<CheckoutApi>()),
        ),

        Provider<AddToCartUseCase>(
          create: (context) => AddToCartUseCase(context.read<CartRepository>()),
        ),
        Provider<RemoveFromCartUseCase>(
          create: (context) =>
              RemoveFromCartUseCase(context.read<CartRepository>()),
        ),
        Provider<GetCartUseCase>(
          create: (context) => GetCartUseCase(context.read<CartRepository>()),
        ),
        Provider<GetProductUseCase>(
          create: (context) =>
              GetProductUseCase(context.read<ProductRepository>()),
        ),

        Provider<DoCheckoutUseCase>(
          create: (context) => DoCheckoutUseCase(
            context.read<CheckoutRepository>(),
            context.read<CartRepository>(),
          ),
        ),

        ChangeNotifierProvider<CartStore>(
          create: (context) => CartStore(
            context.read<AddToCartUseCase>(),
            context.read<RemoveFromCartUseCase>(),
            context.read<GetCartUseCase>(),
          ),
        ),

        ChangeNotifierProvider<ProductsViewModel>(
          create: (context) => ProductsViewModel(
            context.read<CartStore>(),
            context.read<GetProductUseCase>(),
          ),
        ),

        ChangeNotifierProvider<CartViewModel>(
          create: (context) => CartViewModel(
            context.read<CartStore>(),
            context.read<DoCheckoutUseCase>(),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            ProductScreen(productsViewModel: context.read<ProductsViewModel>()),
        '/cart': (context) =>
            CartScreen(cartViewModel: context.read<CartViewModel>()),
        '/finish': (context) {
          final CartEntity cart =
              ModalRoute.of(context)!.settings.arguments as CartEntity;
          return FinishScreen(cart: cart);
        },
      },
    );
  }
}
