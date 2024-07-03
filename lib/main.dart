import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/l10n/l10n.dart';
import 'package:flutter_ecommerce/providers/language_provider.dart';
import 'package:flutter_ecommerce/screens/home_screen.dart';
import 'package:flutter_ecommerce/screens/introduction_screen.dart';
import 'package:flutter_ecommerce/screens/product_detail_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/category_provider.dart';
import 'providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: Selector<LanguageProvider, String>(
        selector: (context, language) => language.getLangCode,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const IntroductionScreen(),
              '/home': (context) => const HomeScreen(),
              '/productDetails': (context) => const ProductDetailScreen(),
            },
            initialRoute: '/',
            title: 'E-Commerce App',
            theme: ThemeData(
              primaryColor: Colors.white,
              useMaterial3: true,
            ),
            supportedLocales: L10n.local,
            locale: Locale(value),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
