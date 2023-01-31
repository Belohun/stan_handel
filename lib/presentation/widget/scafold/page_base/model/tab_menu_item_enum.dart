import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/galvanized/galvanized_metal.dart';
import 'package:stan_handel_web/presentation/page/metal_sheet/sub_page/hot_rolled_metal/hot_rolled_metal.dart';

abstract class TabMenuEnumBase {
  String get route;

  String get name;
}

enum TabMenuRods with TabMenuEnumBase {
  round(
    '', //TODO
    LocaleKeys.home_page_navigation_sub_menu_rods_round,
  );

  const TabMenuRods(
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
    "", //TODO
    LocaleKeys.home_page_navigation_sub_menu_sheet_metal_checkerPlate,
  ),
  coldRolled(
    "", //TODO
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
    '', //TODO

    LocaleKeys.home_page_navigation_sub_menu_pipes_steel,
  ),
  seamless(
    '', //TODO

    LocaleKeys.home_page_navigation_sub_menu_pipes_seamless,
  ),
  seamed(
    '', //TODO

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
    "", //TODO

    LocaleKeys.home_page_navigation_sub_menu_others_steel_angle_bars,
  ),
  closedProfiles(
    "", //TODO

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
