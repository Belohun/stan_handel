import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/calculator/section/calculator_section/cubit/calculator_section_data.dart';
import 'package:stan_handel_web/presentation/page/calculator/section/calculator_section/cubit/calculator_section_state.dart';

@injectable
class CalculatorSectionCubit extends Cubit<CalculatorSectionState> {
  CalculatorSectionCubit() : super(CalculatorSectionState.idle(const CalculatorSectionData()));

  CalculatorSectionData _data = const CalculatorSectionData();

  void onDensityChange(double value) {
    _data = _data.copyWith(
      density: Wrapper(value),
      densityError: const Wrapper(null),
    );
    _updateState();
  }

  void onWidthChange(String? value) {
    _data = _data.copyWith(
      width: Wrapper(value),
      widthError: const Wrapper(null),
    );

    _updateState();
  }

  void onThicknessChange(String? value) {
    _data = _data.copyWith(
      thickness: Wrapper(value),
      thicknessError: const Wrapper(null),
    );

    _updateState();
  }

  void calculate() {
    final result = _validate();
    if (result != null) {
      final width = result.width / 100 ; ///mm -> dm
      final thickness = result.thickness / 100; ///mm -> dm
      final volume = width  * thickness;
      final mass = volume * result.density * 10; ///dm -> m

      _data = _data.copyWith(mass: Wrapper(mass));
    }
    _updateState();
  }

  _ValidationResult? _validate() {
    bool anyValueNullOrEmpty = false;
    double? width, thickness;

    try {
      width = double.parse(_data.width ?? '');
    } catch (_) {
      anyValueNullOrEmpty = true;

      _data = _data.copyWith(widthError: Wrapper(LocaleKeys.calculator_page_calculator_section_noValueError.tr()));
    }

    try {
      thickness = double.parse(_data.thickness ?? '');
    } catch (_) {
      anyValueNullOrEmpty = true;

      _data = _data.copyWith(thicknessError: Wrapper(LocaleKeys.calculator_page_calculator_section_noValueError.tr()));
    }

    if (_data.density == null) {
      anyValueNullOrEmpty = true;

      _data = _data.copyWith(
          densityError: Wrapper(LocaleKeys.calculator_page_calculator_section_noSelectedDensityError.tr()));
    }

    if (anyValueNullOrEmpty) return null;

    return _ValidationResult(width!, thickness!, _data.density!);
  }

  void _updateState() => emit(CalculatorSectionState.idle(_data));
}

class _ValidationResult {
  _ValidationResult(this.width, this.thickness, this.density);

  final double width;
  final double thickness;
  final double density;
}
