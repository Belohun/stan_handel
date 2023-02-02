import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class GalvanizedMetalPage extends HookWidget {
  const GalvanizedMetalPage({super.key});

  static const route = "/galvanized-metal-sheets";

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
          header: LocaleKeys.metal_sheet_galvanized_location_section_header.tr(),
          content: LocaleKeys.metal_sheet_galvanized_location_section_description.tr(),
          color: AppColors.gray7,
          imagePath: Images.galvanizedMetalSheets,
          reversed: true,
        ),
        TextSection(
          header: LocaleKeys.metal_sheet_galvanized_quality_section_header.tr(),
          content: LocaleKeys.metal_sheet_galvanized_quality_section_description.tr(),
          imagePath: Images.quality,
        ),
        TextSection(
          header: LocaleKeys.metal_sheet_galvanized_production_section_header.tr(),
          content: LocaleKeys.metal_sheet_galvanized_production_section_description.tr(),
          color: AppColors.primaryLight,
          imagePath: Images.metalSheetProduction,
          reversed: true,
        ),
      ],
    );
  }
}
