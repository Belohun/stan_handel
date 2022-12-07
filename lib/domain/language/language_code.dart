import 'dart:ui';

enum LanguageCode {
  en,
  pl,
}

class LanguageCodeUtils {
  const LanguageCodeUtils._();

  static LanguageCode fromLocale(Locale locale) {
    final langCode = locale.languageCode;

    switch (langCode) {
      case 'en':
        return LanguageCode.en;

      default:
        return LanguageCode.pl;
    }
  }
}

const fallbackLanguageCode = LanguageCode.pl;

Map<LanguageCode, Locale> availableLocales = {
  LanguageCode.en: const Locale('en'),
  LanguageCode.pl: const Locale('pl'),
};

extension LanguageCodeExtension on LanguageCode {
  String get flagPath {
    switch (this) {
      case LanguageCode.en:
        return 'assets/svg/uk_flag.svg';
      case LanguageCode.pl:
        return 'assets/svg/poland_flag.svg';
    }
  }

  String get languageName {
    switch (this) {
      case LanguageCode.en:
        return 'English';
      case LanguageCode.pl:
        return 'Polski';
    }
  }
}
