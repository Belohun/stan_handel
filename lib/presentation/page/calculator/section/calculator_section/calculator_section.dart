part of '../../calculator_page.dart';

class _CalculatorSection extends HookWidget {
  const _CalculatorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray7,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: context.contentWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: StanHandelCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimens.xl, horizontal: AppDimens.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectionArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppDimens.m),
                          SizedBox(
                            width: context.textContentWidth,
                            child: SeoText(
                              LocaleKeys.calculator_page_image_section_header.tr(),
                              style: context.h1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: AppDimens.m),
                          SizedBox(
                            width: context.textContentWidth,
                            child: SeoText(
                              LocaleKeys.calculator_page_image_section_content.tr(),
                              style: AppTypography.body1,
                              textAlign: TextAlign.left,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimens.xl),
                    Row(
                      children: [
                        Expanded(
                          child: StanHandelTextField(
                            labelText: "Materiał",
                            contentPadding: const EdgeInsets.all(AppDimens.m),
                            initText: "Stal",
                            disabled: true,
                          ),
                        ),
                        const SizedBox(width: AppDimens.m),
                        Expanded(
                          child: _InputRow(
                            title: "Gęstość",
                            suffix: "kg/dm^3",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.m),
                    Row(
                      children: [
                        Expanded(
                          child: _InputRow(
                            title: "Szerokość",
                            suffix: "mm",
                          ),
                        ),
                        const SizedBox(width: AppDimens.m),
                        Expanded(
                          child: _InputRow(
                            title: "Grubość",
                            suffix: "mm",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.m),
                    Row(
                      children: [
                        Expanded(
                          child: StanHandelTextField.numberInput(
                            labelText: "Masa 1m[kg]",
                            contentPadding: const EdgeInsets.all(AppDimens.m),
                            initNumber: 0.00,
                            disabled: true,
                          ),
                        ),
                        const SizedBox(width: AppDimens.m),
                        Expanded(
                          child: PrimaryButton(
                            text: "Oblicz",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  const _InputRow({
    required this.title,
    required this.suffix,
    Key? key,
  }) : super(key: key);

  final String title;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return StanHandelTextField.numberInput(
      contentPadding: const EdgeInsets.all(AppDimens.m).copyWith(right: AppDimens.s),
      labelText: title,
      allowDecimals: true,
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
