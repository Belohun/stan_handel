import 'package:easy_localization/easy_localization.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/calculator/calculator_page.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/model/tab_menu_item_enum.dart';

enum HomePageTabEnum {
  sheetMetal(
    LocaleKeys.home_page_navigation_sheet_metal,
    '',
  ),
  rods(
    LocaleKeys.home_page_navigation_rods,
    '',
  ),
  pipes(
    LocaleKeys.home_page_navigation_pipes,
    '',
  ),
  other(
    LocaleKeys.home_page_navigation_rest,
    '',
  ),
  calculator(
    LocaleKeys.home_page_navigation_calculator,
    CalculatorPage.route,
  ),
  contact(
    LocaleKeys.home_page_navigation_contact,
    '',
  );

  const HomePageTabEnum(this._name, this.route);

  final String _name;
  final String route;

  String get name => _name.tr();

  List<TabMenuEnumBase> get menuTabItems {
    switch (this) {
      case HomePageTabEnum.sheetMetal:
        return TabMenuSheetMetal.values;
      case HomePageTabEnum.rods:
        return TabMenuRods.values;
      case HomePageTabEnum.pipes:
        return TabMenuPipes.values;
      case HomePageTabEnum.other:
        return TabMenuOthers.values;

      case HomePageTabEnum.calculator:
      case HomePageTabEnum.contact:
        return [];
    }
  }
}
