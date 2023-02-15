import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/checker_plate/checker_plate_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/cold_rolled/cold_rolled_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/galvanized/galvanized_metal_page.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/hot_rolled_metal/hot_rolled_metal_page.dart';
import 'package:stan_handel_web/presentation/page/other/subpage/angle_bars.dart';
import 'package:stan_handel_web/presentation/page/other/subpage/closed_profiles.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/seamed/seamed_pipes_page.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/seamless/seamless_pipes_page.dart';
import 'package:stan_handel_web/presentation/page/pipes/sub_page/steel/steel_pipes_page.dart';

abstract class TabMenuEnumBase {
  String get route;

  String get name;
}

enum TabMenuSections with TabMenuEnumBase {
  hotRolled(
    '', //TODO
    LocaleKeys.home_page_navigation_sub_menu_sections_hotRolled,
  );

  const TabMenuSections(
    this.route,
    this._key,
  );

  final String _key;

  @override
  final String route;

  @override
  String get name => _key.tr();
}

enum TabMenuSheetMetal with TabMenuEnumBase {
  hotRolled(
    HotRolledMetalPage.route,
    LocaleKeys.home_page_navigation_sub_menu_sheet_metal_hotRolled,
  ),
  galvanized(
    GalvanizedMetalPage.route,
    LocaleKeys.home_page_navigation_sub_menu_sheet_metal_galvanized,
  ),
  checkerPlate(
    CheckedPlateMetalPage.route,
    LocaleKeys.home_page_navigation_sub_menu_sheet_metal_checkerPlate,
  ),
  coldRolled(
    ColdRolledMetalPage.route,
    LocaleKeys.home_page_navigation_sub_menu_sheet_metal_coldRolled,
  );

  const TabMenuSheetMetal(
    this.route,
    this._key,
  );

  final String _key;

  @override
  final String route;

  @override
  String get name => _key.tr();
}

enum TabMenuPipes with TabMenuEnumBase {
  steel(
    SteelPipesPage.route,
    LocaleKeys.home_page_navigation_sub_menu_pipes_steel,
  ),
  seamless(
    SeamlessPipesPage.route,
    LocaleKeys.home_page_navigation_sub_menu_pipes_seamless,
  ),
  seamed(
    SeamedPipesPage.route,
    LocaleKeys.home_page_navigation_sub_menu_pipes_seamed,
  );

  const TabMenuPipes(
    this.route,
    this._key,
  );

  final String _key;

  @override
  final String route;

  @override
  String get name => _key.tr();
}

enum TabMenuOthers with TabMenuEnumBase {
  angleBars(
    AngleBarsPage.route,
    LocaleKeys.home_page_navigation_sub_menu_others_steel_angle_bars,
  ),
  closedProfiles(
    ClosedProfilesPage.route,
    LocaleKeys.home_page_navigation_sub_menu_others_closed_profiles,
  );

  const TabMenuOthers(
    this.route,
    this._key,
  );

  final String _key;

  @override
  final String route;

  @override
  String get name => _key.tr();
}
