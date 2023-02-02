import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/string_utill.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class SeamlessPipesPage extends HookWidget {
  const SeamlessPipesPage({super.key});

  static const route = '/seamless-pipes';

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
      children: const [
        _DescriptionSection(),
        _ProductionSection(),
        _UsageSection(),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSection(
      header: LocaleKeys.pipes_seamless_description_section_header.tr(),
      content: LocaleKeys.pipes_seamless_description_section_content.tr(),
      reversed: true,
      color: AppColors.gray7,
      imagePath: Images.seamlessPipes,
    );
  }
}

class _ProductionSection extends HookWidget {
  const _ProductionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productionExamplesDottedList = useMemoized(() => _createProductionExamplesDottedList());

    return TextSection(
      header: LocaleKeys.pipes_seamless_production_section_header.tr(),
      content: "${LocaleKeys.pipes_seamless_production_section_content.tr()}\n$productionExamplesDottedList",
      imagePath: Images.production,
    );
  }

  String _createProductionExamplesDottedList() {
    final examplesList = [
      LocaleKeys.pipes_seamless_production_section_construction.tr(),
      LocaleKeys.pipes_seamless_production_section_wired.tr(),
      LocaleKeys.pipes_seamless_production_section_precise.tr(),
    ];

    return StringUtil.createDottedListString(examplesList);
  }
}

class _UsageSection extends HookWidget {
  const _UsageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usageExamplesDottedList = useMemoized(() => _createProductionExamplesDottedList());

    return TextSection(
      header: LocaleKeys.pipes_seamless_usage_section_header.tr(),
      content:
          "${LocaleKeys.pipes_seamless_usage_section_content_p1.tr()}\n$usageExamplesDottedList\n${LocaleKeys.pipes_seamless_usage_section_content_p2.tr()}",
      reversed: true,
      color: AppColors.primaryLight,
    );
  }

  String _createProductionExamplesDottedList() {
    final examplesList = [
      LocaleKeys.pipes_seamless_usage_section_chemical.tr(),
      LocaleKeys.pipes_seamless_usage_section_airline.tr(),
      LocaleKeys.pipes_seamless_usage_section_automotive.tr(),
      LocaleKeys.pipes_seamless_usage_section_furniture.tr(),
      LocaleKeys.pipes_seamless_usage_section_construction.tr(),
      LocaleKeys.pipes_seamless_usage_section_energy.tr(),
      LocaleKeys.pipes_seamless_usage_section_mining.tr(),
    ];

    return StringUtil.createDottedListString(examplesList);
  }
}
