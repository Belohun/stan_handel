import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:stan_handel_web/core/di_config.dart';
import 'package:stan_handel_web/domain/language/language_code.dart';
import 'package:stan_handel_web/presentation/stan_handel_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: availableLocales.values.toList(),
      fallbackLocale: availableLocales[fallbackLanguageCode],
      useOnlyLangCode: true,
      saveLocale: true,
      child: HookedBlocConfigProvider(
        injector: () => getIt,
        child: const StanHandelApp(),
      ),
    ),
  );
}
