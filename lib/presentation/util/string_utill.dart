class StringUtil {

  const StringUtil._();

  static String createDottedListString(List<String> list){
    var combinedString = '\u2022 ${list.first},';

    var index = 1;

    while (index < list.length - 1) {
      final currentText = list[index];
      combinedString += '\n\u2022 $currentText,';
      index++;
    }
    combinedString += '\n\u2022 ${list.last}.';
    return combinedString;
  }
}