extension NullableDoubleExtension on double? {
  String safeFormattedString({
    int? fractionsDigits,
    bool? fractionsAlwaysVisible,
  }) {
    if (this == null) {
      return '';
    }
    return this!.formattedString(fractionsDigits: fractionsDigits);
  }
}

extension DoubleExtension on double {
  String formattedString({
    int? fractionsDigits,
    bool? fractionsAlwaysVisible,
  }) {
    final containsZeroFractions = ceil() == floor();
    if (containsZeroFractions && fractionsAlwaysVisible != true) {
      return toStringAsFixed(0);
    }
    final localizatedString = toStringAsFixed(fractionsDigits ?? 2).replaceAll('.', ',');
    return localizatedString;
  }
}
