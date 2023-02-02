import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stan_handel_web/presentation/page/calculator/calculator_page.dart';
import 'package:stan_handel_web/presentation/page/contact/contact_page.dart';
import 'package:stan_handel_web/presentation/page/home/home_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/checker_plate/checker_plate_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/cold_rolled/cold_rolled_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/galvanized/galvanized_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/hot_rolled_metal/hot_rolled_metal_page.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/seamed/seamed_pipes_page.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/seamless/seamless_pipes_page.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/steel/steel_pipes_page.dart';
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
          HomePage.route: (_) => const HomePage(),
          CalculatorPage.route: (_) => const CalculatorPage(),
          ContactPage.route: (_) => const ContactPage(),
          HotRolledMetalPage.route: (_) => const HotRolledMetalPage(),
          GalvanizedMetalPage.route: (_) => const GalvanizedMetalPage(),
          CheckedPlateMetalPage.route: (_) => const CheckedPlateMetalPage(),
          ColdRolledMetalPage.route: (_) => const ColdRolledMetalPage(),
          SteelPipesPage.route: (_) => const SteelPipesPage(),
          SeamlessPipesPage.route: (_) => const SeamlessPipesPage(),
          SeamedPipesPage.route: (_) => const SeamedPipesPage(),
        },
      ),
    );
  }
}
