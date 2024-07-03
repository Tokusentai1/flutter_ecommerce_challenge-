import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/category_model.dart';
import 'package:flutter_ecommerce/providers/product_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  final Category category;
  const DrawerWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        onTap: () {
          Provider.of<ProductProvider>(context, listen: false)
              .fetechProductsByCategory(categoryName: category.name);
        },
        child: Text(
          category.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
