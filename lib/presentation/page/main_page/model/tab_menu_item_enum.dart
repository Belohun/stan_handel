abstract class TabMenuEnumBase {
}

enum TabMenuRods with TabMenuEnumBase {
  rodsSomething,
}
extension TabMenuRodsExtension on TabMenuRods {
  String get name {
    switch(this){
      case TabMenuRods.rodsSomething:
        return 'Rods something';
    }
  }
}

enum TabMenuSheetMetal with TabMenuEnumBase {
  sheetMetalSomething,
}

enum TabMenuPipes with TabMenuEnumBase {
  tabMenuPipesSomething,
}

class TabMenuUtils {
  const TabMenuUtils._();

  static String getName(TabMenuEnumBase tab) {
    switch(tab.runtimeType){
      case TabMenuRods:
        return (tab as TabMenuRods).name;
      default:
        return '';
    }
  }
}

