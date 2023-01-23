class CalculatorSectionData {
  const CalculatorSectionData({
    this.densityError,
    this.density,
    this.width,
    this.widthError,
    this.thickness,
    this.thicknessError,
    this.mass,
  });

  final double? density;
  final String? densityError;
  final String? width;
  final String? widthError;
  final String? thickness;
  final String? thicknessError;
  final double? mass;

  CalculatorSectionData copyWith({
    Wrapper<double?>? density,
    Wrapper<String?>? densityError,
    Wrapper<String?>? width,
    Wrapper<String?>? widthError,
    Wrapper<String?>? thickness,
    Wrapper<String?>? thicknessError,
    Wrapper<double?>? mass,
  }) =>
      CalculatorSectionData(
        density: density == null ? this.density : density.value,
        densityError: densityError == null ? this.densityError : densityError.value,
        width: width == null ? this.width : width.value,
        widthError: widthError == null ? this.widthError : widthError.value,
        thickness: thickness == null ? this.thickness : thickness.value,
        thicknessError: thicknessError == null ? this.thicknessError : thicknessError.value,
        mass: mass == null ? this.mass : mass.value,
      );
}

class Wrapper<T> {
  const Wrapper(this.value);

  final T? value;
}
