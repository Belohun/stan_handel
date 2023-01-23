import 'package:stan_handel_web/presentation/page/calculator/section/calculator_section/cubit/calculator_section_data.dart';

abstract class CalculatorSectionState {
  factory CalculatorSectionState.idle(CalculatorSectionData data) => CalculatorSectionStateIdle(data);
}

class CalculatorSectionStateIdle implements CalculatorSectionState {
  const CalculatorSectionStateIdle(this.data);

  final CalculatorSectionData data;
}
