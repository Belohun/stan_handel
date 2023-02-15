import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/section/text_section.dart';

class ClosedProfilesPage extends HookWidget {
  const ClosedProfilesPage({super.key});

  static const route = '/closed-profiles';

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return PageBase(
      content: Column(
        children: [
          TextSection(
            header: LocaleKeys.others_closed_profiles_description_section_header.tr(),
            content: LocaleKeys.others_closed_profiles_description_section_content.tr(),
            reversed: true,
            color: AppColors.primaryLight,
            imagePath: Images.closedProfile,
          ),
          TextSection(
            header: LocaleKeys.others_closed_profiles_usage_section_header.tr(),
            content: LocaleKeys.others_closed_profiles_usage_section_content.tr(),
          ),
          TextSection(
            header: LocaleKeys.others_closed_profiles_explanation_section_header.tr(),
            content: LocaleKeys.others_closed_profiles_explanation_section_content.tr(),
            reversed: true,
            color: AppColors.gray7,
          ),
          TextSection(
            header: LocaleKeys.others_closed_profiles_buy_section_header.tr(),
            content: LocaleKeys.others_closed_profiles_buy_section_content.tr(),
          ),
        ],
      ),
      scrollController: scrollController,
    );
  }
}
