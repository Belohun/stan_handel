// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stan_handel_web/domain/language/language_code.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/page/main_page/model/home_page_tab_enum.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/style/screen_size.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/button/primary_button.dart';
import 'package:stan_handel_web/presentation/widget/seo_text.dart';

part 'sections/navigation_section.dart';

part 'sections/image_section.dart';

part 'sections/satisfaction_section.dart';

part 'sections/app_bar_section.dart';

part 'sections/map_section.dart';

part 'sections/footer_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: _Body(),
      );
}

class _Body extends HookWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final mapKey = useMemoized(
      () => GlobalKey(),
      [context],
    );

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
            context.isScreenSmall ? const SizedBox.shrink() : const _AppBarSection(),
            const _NavigationSection(),
            _ImageSection(
              onFindUsButtonPressed: () {
                final currentPositionOffset = Offset(0, scrollController.offset);
                final mapRenderBox = mapKey.currentContext?.findRenderObject() as RenderBox;
                final mapPosition = mapRenderBox.localToGlobal(currentPositionOffset);

                scrollController.animateTo(
                  mapPosition.dy,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
            const _SatisfactionSection(),
            _MapSection(
              key: mapKey,
            ),
            const _FooterSection(),
          ],
        ),
      ),
    );
  }
}
