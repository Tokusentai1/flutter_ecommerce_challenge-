import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String langCode = 'en';

  String get getLangCode => langCode;

  void changeLangCode({required String newLangCode}) {
    langCode = newLangCode;
    notifyListeners();
  }
}
