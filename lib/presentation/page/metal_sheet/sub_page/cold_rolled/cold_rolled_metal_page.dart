import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/string_utill.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class ColdRolledMetalPage extends HookWidget {
  const ColdRolledMetalPage({super.key});

  static const route = "/hot-rolled-metal-sheet";

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    return PageBase(
      content: const _Content(),
      scrollController: controller,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextSection(
          color: AppColors.gray7,
          header: LocaleKeys.metal_sheet_cold_rolled_description_section_header.tr(),
          content: LocaleKeys.metal_sheet_cold_rolled_description_section_description.tr(),
          reversed: true,
          imagePath: Images.metalSheetColdRolled,
        ),
        const _UsageSection(),
        TextSection(
          color: AppColors.primaryLight,
          header: LocaleKeys.metal_sheet_cold_rolled_production_section_header.tr(),
          content: LocaleKeys.metal_sheet_cold_rolled_production_section_description.tr(),
          reversed: true,
        ),
        TextSection(
          header: LocaleKeys.metal_sheet_cold_rolled_quality_section_header.tr(),
          content: LocaleKeys.metal_sheet_cold_rolled_quality_section_description.tr(),
        )
      ],
    );
  }
}

class _UsageSection extends HookWidget {
  const _UsageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examplesList = useMemoized(() => _createDottedListExamples());

    return TextSection(
      header: LocaleKeys.metal_sheet_cold_rolled_usage_section_header.tr(),
      content:
          "${LocaleKeys.metal_sheet_cold_rolled_usage_section_description_p1.tr()}\n$examplesList\n${LocaleKeys.metal_sheet_cold_rolled_usage_section_description_p2.tr()}",
      imagePath: Images.questionMark,
    );
  }
}

String _createDottedListExamples() {
  final examplesList = [
    LocaleKeys.metal_sheet_cold_rolled_usage_section_car_industry.tr(),
    LocaleKeys.metal_sheet_cold_rolled_usage_section_household_goods.tr(),
    LocaleKeys.metal_sheet_cold_rolled_usage_section_electronic_equipment.tr(),
  ];

  return StringUtil.createDottedListString(examplesList);
}
