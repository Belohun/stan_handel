import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/button/primary_button.dart';
import 'package:stan_handel_web/presentation/widget/container/stan_handel_card.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';
import 'package:stan_handel_web/presentation/widget/text/stan_handel_text_field.dart';

part 'section/image_section.dart';

part 'section/calculator_section/calculator_section.dart';

class CalculatorPage extends HookWidget {
  const CalculatorPage({super.key});

  static const String route = '/calculator';

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return PageBase(
      content: Column(
        children: const [
         _CalculatorSection(),
        ],
      ),
      scrollController: scrollController,
    );
  }
}
