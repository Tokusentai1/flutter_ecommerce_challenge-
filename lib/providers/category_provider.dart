import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/category_model.dart';
import '../Api/api.dart';
import '../controllers/api_controller.dart';

class CategoryProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Category>? categories;
  final ApiController _apiController = ApiController();

  bool get isLoadingCategory => _isLoading;
  Future<void> fetechCategories() async {
    final response = await _apiController.fetechAllData(
      uri: uri + categoriesUri,
      fromJson: Category.fromJson,
    );

    categories = response;
    _isLoading = false;
    notifyListeners();
  }
}
