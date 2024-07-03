import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProductDetailWidget extends StatelessWidget {
  final Product product;
  const ProductDetailWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            product.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          productCard(
              product.title, AppLocalizations.of(context)!.title, Icons.title),
          productCard(product.rating.rate.toString(),
              AppLocalizations.of(context)!.rating, Icons.star),
          productCard(product.rating.count.toString(),
              AppLocalizations.of(context)!.count, Icons.numbers_outlined),
          productCard(product.price.toString(),
              AppLocalizations.of(context)!.price, Icons.attach_money),
          productCard(product.category, AppLocalizations.of(context)!.category,
              Icons.category),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            alignment:
                Provider.of<LanguageProvider>(context).getLangCode == 'en'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            child: Text(
              AppLocalizations.of(context)!.productDescription,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          productDescription(),
        ],
      ),
    );
  }

  Container productDescription() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: SingleChildScrollView(
        child: Text(
          product.description,
        ),
      ),
    );
  }
}

Card productCard(String provider, String text, IconData icon) {
  return Card(
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              provider,
            ),
          ),
        ],
      ),
      leading: SizedBox(
        width: 139,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}
