import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/string_utill.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class SteelPipesPage extends HookWidget {
  const SteelPipesPage({super.key});

  static const route = '/steel-pipes';

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
          header: LocaleKeys.pipes_steel_location_section_header.tr(),
          content: LocaleKeys.pipes_steel_location_section_content.tr(),
          color: AppColors.primaryLight,
          imagePath: Images.steelPipes,
        ),
        TextSection(
          header: LocaleKeys.pipes_steel_usage_section_header.tr(),
          content: LocaleKeys.pipes_steel_usage_section_content.tr(),
          reversed: true,
          imagePath: Images.usage,
        ),
        const _AdvantagesSection(),
        TextSection(
          header: LocaleKeys.pipes_steel_quality_section_header.tr(),
          content: LocaleKeys.pipes_steel_quality_section_content.tr(),
          reversed: true,
        ),
      ],
    );
  }
}

class _AdvantagesSection extends HookWidget {
  const _AdvantagesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dottedAdvantagesList = useMemoized(() => _createDottedAdvantagesList());

    return TextSection(
      header: LocaleKeys.pipes_steel_advantages_section_header.tr(),
      content: "${LocaleKeys.pipes_steel_advantages_section_content.tr()}\n$dottedAdvantagesList",
      color: AppColors.gray7,
    );
  }

  String _createDottedAdvantagesList() {
    final advantagesList = [
      LocaleKeys.pipes_steel_advantages_section_temp_resistance.tr(),
      LocaleKeys.pipes_steel_advantages_section_stretch_resistance.tr(),
      LocaleKeys.pipes_steel_advantages_section_tightness.tr(),
      LocaleKeys.pipes_steel_advantages_section_chemical_resistance.tr(),
    ];

    return StringUtil.createDottedListString(advantagesList);
  }
}
