import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/main_page/model/tab_menu_item_enum.dart';

enum HomePageTabEnum {
  sheetMetal,
  rods,
  pipes,
  calculator,
  other,
  contact,
}

extension HomePageTabEnumExtension on HomePageTabEnum {
  String get name {
    switch (this) {
      case HomePageTabEnum.sheetMetal:
        return LocaleKeys.home_page_navigation_sheet_metal.tr();
      case HomePageTabEnum.rods:
        return LocaleKeys.home_page_navigation_rods.tr();
      case HomePageTabEnum.pipes:
        return LocaleKeys.home_page_navigation_pipes.tr();
      case HomePageTabEnum.other:
        return LocaleKeys.home_page_navigation_rest.tr();
      case HomePageTabEnum.contact:
        return LocaleKeys.home_page_navigation_contact.tr();
      case HomePageTabEnum.calculator:
        return LocaleKeys.home_page_navigation_calculator.tr();
    }
  }

  List<TabMenuEnumBase> get menuTabItems {
    switch (this) {
      case HomePageTabEnum.sheetMetal:
        return TabMenuSheetMetal.values;
      case HomePageTabEnum.rods:
        return TabMenuRods.values;
      case HomePageTabEnum.pipes:
        return TabMenuPipes.values;
      case HomePageTabEnum.calculator:
      case HomePageTabEnum.other:
      case HomePageTabEnum.contact:
        return [];
    }
  }
}
