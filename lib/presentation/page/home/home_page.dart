import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/widget/section/map_section.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/button/primary_button.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';


part 'sections/image_section.dart';

part 'sections/satisfaction_section.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final mapKey = useMemoized(
      () => GlobalKey(),
      [context],
    );

    return PageBase(
      scrollController: scrollController,
      content: _Body(
        scrollController: scrollController,
        mapKey: mapKey,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.scrollController,
    required this.mapKey,
  }) : super(key: key);

  final ScrollController scrollController;
  final GlobalKey<State<StatefulWidget>> mapKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        MapSection(
          key: mapKey,
        ),
      ],
    );
  }
}
