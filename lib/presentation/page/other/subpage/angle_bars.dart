import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class AngleBarsPage extends HookWidget {
  const AngleBarsPage({super.key});

  static const route = '/steel-angle-bars';

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    return PageBase(
      content: Column(
        children: [
          TextSection(
            header: LocaleKeys.others_angle_bars_description_section_header.tr(),
            content: LocaleKeys.others_angle_bars_description_section_content.tr(),
            reversed: true,
            color: AppColors.gray7,
            imagePath: Images.angleBar,
          ),
          TextSection(
            header: LocaleKeys.others_angle_bars_explanation_section_header.tr(),
            content: LocaleKeys.others_angle_bars_explanation_section_description.tr(),
          ),
          TextSection(
            header: LocaleKeys.others_angle_bars_usage_section_header.tr(),
            content: LocaleKeys.others_angle_bars_usage_section_content.tr(),
            color: AppColors.primaryLight,
            reversed: true,
          ),
        ],
      ),
      scrollController: controller,
    );
  }
}
