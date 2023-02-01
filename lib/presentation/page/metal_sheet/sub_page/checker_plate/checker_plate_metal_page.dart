import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class CheckedPlateMetalPage extends HookWidget {
  const CheckedPlateMetalPage({super.key});

  static const route = "/checker-plate-metal-sheet";

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
          background: AppColors.primaryLight,
          header: LocaleKeys.metal_sheet_checker_plate_description_section_header.tr(),
          content: LocaleKeys.metal_sheet_checker_plate_description_section_description.tr(),
          imagePath: Images.metalSheetCheckerPlate,
        ),
        TextSection(
          header: LocaleKeys.metal_sheet_checker_plate_usage_section_header.tr(),
          content: LocaleKeys.metal_sheet_checker_plate_usage_section_description.tr(),
          reversed: true,
        ),
        TextSection(
          background: AppColors.gray7,
          header: LocaleKeys.metal_sheet_checker_plate_quality_section_header.tr(),
          content: LocaleKeys.metal_sheet_checker_plate_quality_section_description.tr(),
        )
      ],
    );
  }
}
