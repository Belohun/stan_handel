import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stan_handel_web/domain/language/language_code.dart';
import 'package:stan_handel_web/presentation/stan_handel_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: availableLocales.values.toList(),
      fallbackLocale: availableLocales[fallbackLanguageCode],
      useOnlyLangCode: true,
      saveLocale: true,
      child: const StanHandelApp(),
    ),
  );
}
