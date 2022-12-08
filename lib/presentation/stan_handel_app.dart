import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/page/main_page/main_page.dart';
import 'package:stan_handel_web/presentation/style/app_themes.dart';

class StanHandelApp extends StatelessWidget {
  const StanHandelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightStyle,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
      },
    );
  }
}
