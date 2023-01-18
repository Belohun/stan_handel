import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';

abstract class TabMenuEnumBase {}

extension TabMenuExtension on TabMenuEnumBase {
  String get name {
    switch (runtimeType) {
      case TabMenuRods:
        return (this as TabMenuRods).name;

      case TabMenuSheetMetal:
        return (this as TabMenuSheetMetal).name;

      case TabMenuPipes:
        return (this as TabMenuPipes).name;

      case TabMenuOthers:
        return (this as TabMenuOthers).name;

      default:
        return '';
    }
  }
}

enum TabMenuRods with TabMenuEnumBase { round }

extension TabMenuRodsExtension on TabMenuRods {
  String get name {
    switch (this) {
      case TabMenuRods.round:
        return LocaleKeys.home_page_navigation_sub_menu_rods_round.tr();
    }
  }
}

enum TabMenuSheetMetal with TabMenuEnumBase {
  hotRolled,
  galvanized,
  checkerPlate,
  coldRolled,
}

extension TabMenuSheetMetalExtension on TabMenuSheetMetal {
  String get name {
    switch (this) {
      case TabMenuSheetMetal.hotRolled:
        return LocaleKeys.home_page_navigation_sub_menu_sheet_metal_hotRolled.tr();
      case TabMenuSheetMetal.galvanized:
        return LocaleKeys.home_page_navigation_sub_menu_sheet_metal_galvanized.tr();

      case TabMenuSheetMetal.checkerPlate:
        return LocaleKeys.home_page_navigation_sub_menu_sheet_metal_checkerPlate.tr();

      case TabMenuSheetMetal.coldRolled:
        return LocaleKeys.home_page_navigation_sub_menu_sheet_metal_coldRolled.tr();
    }
  }
}

enum TabMenuPipes with TabMenuEnumBase {
  steel,
  seamless,
  seamed,
}

extension TabMenuPipesExtension on TabMenuPipes {
  String get name {
    switch (this) {
      case TabMenuPipes.steel:
        return LocaleKeys.home_page_navigation_sub_menu_pipes_steel.tr();

      case TabMenuPipes.seamless:
        return LocaleKeys.home_page_navigation_sub_menu_pipes_seamless.tr();

      case TabMenuPipes.seamed:
        return LocaleKeys.home_page_navigation_sub_menu_pipes_seamed.tr();
    }
  }
}

enum TabMenuOthers with TabMenuEnumBase {
  angleBars,
  closedProfiles,
}

extension TabMenuOthersExtension on TabMenuOthers {
  String get name {
    switch (this) {
      case TabMenuOthers.angleBars:
        return LocaleKeys.home_page_navigation_sub_menu_others_steel_angle_bars.tr();

      case TabMenuOthers.closedProfiles:
        return LocaleKeys.home_page_navigation_sub_menu_others_closed_profiles.tr();
    }
  }
}
