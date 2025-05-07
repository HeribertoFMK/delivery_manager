import 'package:flutter/material.dart';

/// Provider responsável pela definição da localidade do app.
class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}

/// Lista de idiomas suportados e bandeiras associadas.
/// Essa classe pode ser movida para um arquivo separado, como `l10n.dart`.
class L10n {
  static const all = [
    Locale('en'), // 🇺🇸 English
    Locale('pt'), // 🇧🇷 Português
    Locale('es'), // 🇪🇸 Español
    Locale('fr'), // 🇫🇷 Français
    Locale('ja'), // 🇯🇵 日本語
    Locale('ko'), // 🇰🇷 한국어
    Locale('zh'), // 🇨🇳 中文
    Locale('de'), // 🇩🇪 Deutsch (Alemão)
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸 English';
      case 'pt':
        return '🇧🇷 Português';
      case 'es':
        return '🇪🇸 Español';
      case 'fr':
        return '🇫🇷 Français';
      case 'ja':
        return '🇯🇵 日本語';
      case 'ko':
        return '🇰🇷 한국어';
      case 'zh':
        return '🇨🇳 中文';
      case 'de':
        return '🇩🇪 Deutsch';
      default:
        return '🏳️';
    }
  }
}
