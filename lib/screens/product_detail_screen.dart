import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/providers/product_provider.dart';
import 'package:flutter_ecommerce/widgets/product_detail_shimmer_widget.dart';
import 'package:flutter_ecommerce/widgets/product_detail_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    Provider.of<ProductProvider>(context, listen: false)
        .fetechProductById(productId: id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.productDetail,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoadingProduct ||
              productProvider.product == null) {
            return const ProductDetailShimmerWidget();
          } else {
            return ProductDetailWidget(
              product: productProvider.product!,
            );
          }
        },
      ),
    );
  }
}
