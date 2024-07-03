import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/api_controller.dart';
import 'package:flutter_ecommerce/models/product_model.dart';

import '../Api/api.dart';

class ProductProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Product>? products;
  Product? product;
  final ApiController _apiController = ApiController();

  bool get isLoadingProduct => _isLoading;

  Future<void> fetechAllProducts() async {
    final response = await _apiController.fetechAllData(
      uri: uri,
      fromJson: (json) => Product.fromJson(json),
    );

    products = response;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetechProductsByCategory({required String categoryName}) async {
    final response = await _apiController.fetechAllData(
      uri: uri + categoryUri + categoryName,
      fromJson: (json) => Product.fromJson(json),
    );

    products = response;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetechProductById({required int productId}) async {
    final response = await _apiController.fetechData(
      uri: "$uri/$productId",
      fromJson: (json) => Product.fromJson(json),
    );

    product = response;
    _isLoading = false;
    notifyListeners();
  }
}
