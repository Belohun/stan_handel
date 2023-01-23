// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:stan_handel_web/domain/language/language_code.dart';
import 'package:stan_handel_web/presentation/style/app_shadows.dart';
import 'package:stan_handel_web/presentation/widget/container/stan_handel_card.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/model/home_page_tab_enum.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/model/tab_menu_item_enum.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/sections/navigation_section/cubit/navigation_section_cubit.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/style/screen_size.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/button/hover_on_button.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';
import 'package:stan_handel_web/presentation/extension/navigator_extension.dart';

part 'sections/navigation_section/navigation_section.dart';

part 'sections/app_bar_section.dart';

part 'sections/footer_section.dart';

class PageBase extends StatelessWidget {
  const PageBase({
    required this.content,
    required this.scrollController,
    super.key,
  });

  final Widget content;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: _Body(
          content: content,
          scrollController: scrollController,
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body({
    required this.content,
    required this.scrollController,
    super.key,
  });

  final Widget content;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AppBarSection(),
            const _NavigationSection(),
            content,
            const _FooterSection(),
          ],
        ),
      ),
    );
  }
}
