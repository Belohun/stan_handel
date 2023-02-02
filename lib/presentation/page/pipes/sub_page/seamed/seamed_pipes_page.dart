import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/string_utill.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class SeamedPipesPage extends HookWidget {
  const SeamedPipesPage({super.key});

  static const route = '/seamed-pipes';

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
          header: LocaleKeys.pipes_seamed_description_section_header.tr(),
          content: LocaleKeys.pipes_seamed_description_section_content.tr(),
          color: AppColors.primaryLight,
          imagePath: Images.seamedPipe,
        ),
        TextSection(
          header: LocaleKeys.pipes_seamed_production_section_header.tr(),
          content: LocaleKeys.pipes_seamed_production_section_content.tr(),
          reversed: true,
          imagePath: Images.productionAlternative,
        ),
        const _UsageSection(),
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
    final dotedExampleList = useMemoized(() => _createDottedExampleList());

    return TextSection(
      header: LocaleKeys.pipes_seamed_usage_section_header.tr(),
      content:
          "${LocaleKeys.pipes_seamed_usage_section_content_p1.tr()}\n$dotedExampleList\n${LocaleKeys.pipes_seamed_usage_section_content_p2.tr()}",
      color: AppColors.gray7,
    );
  }

  String _createDottedExampleList() {
    final examplesList = [
      LocaleKeys.pipes_seamed_usage_section_chemical.tr(),
      LocaleKeys.pipes_seamed_usage_section_automotive.tr(),
      LocaleKeys.pipes_seamed_usage_section_construction.tr(),
      LocaleKeys.pipes_seamed_usage_section_energy.tr(),
      LocaleKeys.pipes_seamed_usage_section_mining.tr(),
    ];

    return StringUtil.createDottedListString(examplesList);
  }
}
