import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/generated/local_keys.g.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';

class HotRolledMetal extends HookWidget {
  const HotRolledMetal({super.key});

  static const route = "/hot-rolled-metal-sheets";

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    return PageBase(
      content: Column(
        children: const [
          _LocationSection(),
          _QualitySection(),
          _UsageSection(),
          _ProductionSection(),
        ],
      ),
      scrollController: controller,
    );
  }
}

class _ProductionSection extends StatelessWidget {
  const _ProductionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SizedBox(
        height: context.contentHeight,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
              child: SizedBox(
                width: context.contentWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!context.isScreenSmall) const Spacer(),
                    Expanded(
                      child: Column(
                        children: [
                          SeoText(
                            LocaleKeys.metal_sheet_hot_rolled_production_section_header.tr(),
                            style: context.h1,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: AppDimens.s),
                          SeoText(
                            LocaleKeys.metal_sheet_hot_rolled_production_section_description.tr(),
                            style: AppTypography.body1,
                            textAlign: TextAlign.left,
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UsageSection extends HookWidget {
  const _UsageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dottedExamplesString = useMemoized(_createDottedListExamples);

    return SelectionArea(
      child: Container(
        color: AppColors.gray7,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.c),
              child: SizedBox(
                width: context.contentWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SeoText(
                            LocaleKeys.metal_sheet_hot_rolled_usage_section_header.tr(),
                            style: context.h1,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: AppDimens.s),
                          SeoText(
                            LocaleKeys.metal_sheet_hot_rolled_usage_section_description.tr(),
                            style: AppTypography.body1.copyWith(),
                            textAlign: TextAlign.left,
                            maxLines: null,
                          ),
                          const SizedBox(height: AppDimens.s),
                          SeoText(
                            dottedExamplesString,
                            style: AppTypography.body1,
                            textAlign: TextAlign.left,
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                    if (!context.isScreenSmall) const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _QualitySection extends StatelessWidget {
  const _QualitySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: context.isScreenSmall ? const _QualitySectionSmall() : const _QualitySectionBig(),
    );
  }
}

class _QualitySectionBig extends StatelessWidget {
  const _QualitySectionBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.contentHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!context.isScreenSmall)
                    Expanded(
                      child: Image(
                        height: context.bigIconHeight,
                        fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                        image: const AssetImage(Images.quality),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        SeoText(
                          LocaleKeys.metal_sheet_hot_rolled_quality_section_header.tr(),
                          style: context.h1,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: AppDimens.s),
                        SeoText(
                          LocaleKeys.metal_sheet_hot_rolled_quality_section_description.tr(),
                          style: AppTypography.body1,
                          textAlign: TextAlign.left,
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _QualitySectionSmall extends StatelessWidget {
  const _QualitySectionSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Column(
                children: [
                  Image(
                    height: context.bigIconHeight,
                    fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                    image: const AssetImage(Images.quality),
                  ),
                  const SizedBox(height: AppDimens.xl),
                  SeoText(
                    LocaleKeys.metal_sheet_hot_rolled_quality_section_header.tr(),
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: AppDimens.s),
                  SeoText(
                    LocaleKeys.metal_sheet_hot_rolled_quality_section_description.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: context.isScreenSmall ? const _LocationSectionSmall() : const _LocationSectionBig(),
    );
  }
}

class _LocationSectionBig extends StatelessWidget {
  const _LocationSectionBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      height: context.contentHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SeoText(
                          LocaleKeys.metal_sheet_hot_rolled_location_section_header.tr(),
                          style: context.h1,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: AppDimens.s),
                        SeoText(
                          LocaleKeys.metal_sheet_hot_rolled_location_section_description.tr(),
                          style: AppTypography.body1,
                          textAlign: TextAlign.left,
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                  if (!context.isScreenSmall)
                    Expanded(
                      child: Image(
                        height: context.bigIconHeight,
                        fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                        image: const AssetImage(Images.localization),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LocationSectionSmall extends StatelessWidget {
  const _LocationSectionSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Column(
                children: [
                  Image(
                    height: context.bigIconHeight,
                    fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                    image: const AssetImage(Images.localization),
                  ),
                  const SizedBox(height: AppDimens.xl),
                  SeoText(
                    LocaleKeys.metal_sheet_hot_rolled_location_section_header.tr(),
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: AppDimens.s),
                  SeoText(
                    LocaleKeys.metal_sheet_hot_rolled_location_section_description.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String _createDottedListExamples() {
  final examplesList = [
    LocaleKeys.metal_sheet_hot_rolled_usage_section_bridges.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_footbridge.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_stairs.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_containers.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_boats_n_ships.tr(),
    LocaleKeys.metal_sheet_hot_rolled_usage_section_machines.tr(),
  ];

  var combinedString = '\u2022 ${examplesList.first},';

  var index = 1;

  while (index < examplesList.length - 1) {
    final currentText = examplesList[index];
    combinedString += '\n\u2022 $currentText,';
    index++;
  }
  combinedString += '\n\u2022 ${examplesList.last}.';
  return combinedString;
}
