part of '../../calculator_page.dart';

const densityList = [
  7.85,
  8.0,
];

class _CalculatorSection extends HookWidget {
  const _CalculatorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray7,
      width: double.infinity,
      height: context.bigContentHeight,
      child: Center(
        child: SizedBox(
          width: context.contentWidth,
          child: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends HookWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CalculatorSectionCubit>();
    final state = useBlocBuilder(cubit);

    if (state is! CalculatorSectionStateIdle) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
      child: StanHandelCard(
        child: Padding(
          padding: EdgeInsets.all(context.isScreenSmall ? AppDimens.m : AppDimens.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Description(),
              const SizedBox(height: AppDimens.xl),
              _Density(
                cubit: cubit,
                data: state.data,
              ),
              const SizedBox(height: AppDimens.m),
              _InputsRow(
                cubit: cubit,
                data: state.data,
              ),
              const SizedBox(height: AppDimens.m),
              _CalculateRow(
                cubit: cubit,
                data: state.data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalculateRow extends StatelessWidget {
  const _CalculateRow({
    required this.cubit,
    required this.data,
    Key? key,
  }) : super(key: key);

  final CalculatorSectionCubit cubit;
  final CalculatorSectionData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: _InfoColumn(
                  title: '${LocaleKeys.calculator_page_calculator_section_mass.tr()} 1m [kg]',
                  info: data.mass.safeFormattedString(fractionsDigits: 3),
                ),
              ),
              const SizedBox(width: AppDimens.m),
              Expanded(
                child: PrimaryButton(
                  radius: const BorderRadius.all(
                    Radius.circular(AppDimens.cardRadius),
                  ),
                  text: LocaleKeys.calculator_page_calculator_section_calculate.tr(),
                  onPressed: cubit.calculate,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InputsRow extends StatelessWidget {
  const _InputsRow({
    required this.data,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final CalculatorSectionCubit cubit;
  final CalculatorSectionData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _InputRow(
            title: LocaleKeys.calculator_page_calculator_section_width.tr(),
            suffix: "mm",
            initNumber: data.width == null ? null : double.tryParse(data.width!),
            errorText: data.widthError,
            onChanged: cubit.onWidthChange,
          ),
        ),
        const SizedBox(width: AppDimens.m),
        Expanded(
          child: _InputRow(
            title: LocaleKeys.calculator_page_calculator_section_thickness.tr(),
            suffix: "mm",
            initNumber: data.thickness == null ? null : double.tryParse(data.thickness!),
            errorText: data.thicknessError,
            onChanged: cubit.onThicknessChange,
          ),
        ),
      ],
    );
  }
}

class _Density extends StatelessWidget {
  const _Density({
    required this.cubit,
    required this.data,
    Key? key,
  }) : super(key: key);

  final CalculatorSectionCubit cubit;
  final CalculatorSectionData data;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<double?>(
              isExpanded: true,
              hint: Text(
                LocaleKeys.calculator_page_calculator_section_density.tr(),
                style: AppTypography.big.copyWith(color: AppColors.gray2),
              ),
              items: densityList
                  .map((item) => DropdownMenuItem<double>(
                        value: item,
                        child: Text(
                          '$item kg/dm³',
                          style: AppTypography.big,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: data.density,
              onChanged: (value) {
                if (value == null) return;
                cubit.onDensityChange(value);
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              iconSize: AppDimens.smallIconSize,
              iconEnabledColor: AppColors.primaryDark,
              iconDisabledColor: Colors.grey,
              buttonHeight: AppDimens.xc,
              buttonPadding: const EdgeInsets.only(right: AppDimens.m),
              buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                  border: Border.all(color: data.densityError == null ? AppColors.primaryDark : AppColors.red)),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.cardRadius),
              ),
            ),
          ),
          if (data.densityError != null) ...[
            const SizedBox(height: AppDimens.s),
            Text(
              data.densityError ?? '',
              style: AppTypography.small.copyWith(color: AppColors.red),
            )
          ]
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoText(
            LocaleKeys.calculator_page_calculator_section_header.tr(),
            style: context.h1,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: AppDimens.m),
          SeoText(
            LocaleKeys.calculator_page_calculator_section_content.tr(),
            style: AppTypography.body1,
            textAlign: TextAlign.left,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  const _InputRow({
    required this.title,
    required this.suffix,
    required this.initNumber,
    required this.errorText,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String title;
  final String suffix;
  final double? initNumber;
  final String? errorText;
  final Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return StanHandelTextField.numberInput(
      contentPadding: const EdgeInsets.all(AppDimens.m).copyWith(right: AppDimens.s),
      labelText: title,
      initNumber: initNumber,
      allowDecimals: true,
      errorText: errorText,
      onChanged: onChanged,
      suffix: Padding(
        padding: const EdgeInsets.only(right: AppDimens.m),
        child: Text(
          suffix,
          style: AppTypography.big.copyWith(color: AppColors.gray2),
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.big.copyWith(color: AppColors.gray2),
            ),
            const SizedBox(height: AppDimens.s),
            Text(
              info,
              style: AppTypography.h3w400.copyWith(color: AppColors.darkBlue, height: 1),
            )
          ],
        ),
      ),
    );
  }
}
