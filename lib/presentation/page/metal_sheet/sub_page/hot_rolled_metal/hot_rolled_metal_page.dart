import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class HotRolledMetalPage extends HookWidget {
  const HotRolledMetalPage({super.key});

  static const route = "/hot-rolled-metal-sheets";

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    return PageBase(
      content: Column(
        children: const [
          _LocationSection(),
          _QualitySection(),
          _UsageSection(),
          _ProductionSection(),
        ],
      ),
      scrollController: controller,
    );
  }
}

class _ProductionSection extends StatelessWidget {
  const _ProductionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSection(
      header: LocaleKeys.metal_sheet_hot_rolled_production_section_header.tr(),
      content: LocaleKeys.metal_sheet_hot_rolled_production_section_description.tr(),
      reversed: true,
    );
  }
}

class _UsageSection extends HookWidget {
  const _UsageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dottedExamplesString = useMemoized(_createDottedListExamples);

    return TextSection(
      header: LocaleKeys.metal_sheet_hot_rolled_usage_section_header.tr(),
      content: '${LocaleKeys.metal_sheet_hot_rolled_usage_section_description.tr()}\n$dottedExamplesString',
      background: AppColors.gray7,
    );
  }
}

class _QualitySection extends StatelessWidget {
  const _QualitySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSection(
      header: LocaleKeys.metal_sheet_hot_rolled_quality_section_header.tr(),
      content: LocaleKeys.metal_sheet_hot_rolled_quality_section_description.tr(),
      imagePath: Images.quality,
      reversed: true,
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSection(
      header: LocaleKeys.metal_sheet_hot_rolled_location_section_header.tr(),
      content: LocaleKeys.metal_sheet_hot_rolled_location_section_description.tr(),
      background: AppColors.primaryLight,
      imagePath: Images.metalSheets,
    );
  }
}

String _createDottedListExamples() {
  final examplesList = [
    LocaleKeys.metal_sheet_hot_rolled_usage_section_bridges.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_footbridge.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_stairs.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_containers.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_boats_n_ships.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_machines.tr(),
  ];

  var combinedString = '\u2022 ${examplesList.first},';

  var index = 1;

  while (index < examplesList.length - 1) {
    final currentText = examplesList[index];
    combinedString += '\n\u2022 $currentText,';
    index++;
  }
  combinedString += '\n\u2022 ${examplesList.last}.';
  return combinedString;
}
