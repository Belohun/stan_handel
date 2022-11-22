import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';

enum HomePageTabEnum {
  sheetMetal,
  rods,
  pipes,
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
    }
  }
}
