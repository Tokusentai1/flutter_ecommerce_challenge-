import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/providers/category_provider.dart';
import 'package:flutter_ecommerce/providers/language_provider.dart';
import 'package:flutter_ecommerce/widgets/product_card_shimmer_widget.dart';
import 'package:flutter_ecommerce/widgets/product_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/drawer_shimmer_widget.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).fetechAllProducts();
    Provider.of<CategoryProvider>(context, listen: false).fetechCategories();
    return Scaffold(
      appBar: AppBar(),
      drawer: FractionallySizedBox(
        widthFactor: 0.5,
        child: Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
            if (categoryProvider.isLoadingCategory) {
              return Drawer(
                child: SafeArea(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const DrawerShimmerWidget();
                  },
                  itemCount: 5,
                )),
              );
            } else {
              return Drawer(
                child: SafeArea(
                  child: Column(
                    children: [
                      ListTile(
                          title: InkWell(
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .fetechAllProducts();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.allProducts,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return DrawerWidget(
                                  category:
                                      categoryProvider.categories![index]);
                            },
                            itemCount: categoryProvider.categories!.length),
                      ),
                      const Divider(),
                      Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.changeLang,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Selector<LanguageProvider, String>(
                        selector: (context, language) => language.getLangCode,
                        builder: (context, value, child) {
                          bool isSelected = value == 'ar';
                          return Switch(
                            value: isSelected,
                            onChanged: (value) {
                              String newLanguageCode = value ? 'ar' : 'en';
                              context
                                  .read<LanguageProvider>()
                                  .changeLangCode(newLangCode: newLanguageCode);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoadingProduct) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (ctx, index) {
                return const ProductCardShimmerWidget();
              },
              itemCount: 10,
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (ctx, index) {
                return ProductCardWidget(
                    product: productProvider.products![index]);
              },
              itemCount: productProvider.products!.length,
            );
          }
        },
      ),
    );
  }
}
