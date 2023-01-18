import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stan_handel_web/presentation/page/calculator/calculator_page.dart';
import 'package:stan_handel_web/presentation/page/home/home_page.dart';
import 'package:stan_handel_web/presentation/style/app_themes.dart';

class StanHandelApp extends StatelessWidget {
  const StanHandelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        theme: AppThemes.lightStyle,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (context) => const HomePage(),
          CalculatorPage.route: (context) => const CalculatorPage(),
        },
      ),
    );
  }
}
