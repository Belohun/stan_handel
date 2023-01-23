part of '../home_page.dart';

class _SatisfactionSection extends StatelessWidget {
  const _SatisfactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: context.isScreenSmall ? const _SatisfactionSectionSmall() : const _SatisfactionSectionBig(),
    );
  }
}

class _SatisfactionSectionBig extends StatelessWidget {
  const _SatisfactionSectionBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.contentHeight,
      width: context.contentWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectionArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.textContentWidth,
                  child: SeoText(
                    LocaleKeys.home_page_satisfaction_section_header.tr(),
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: AppDimens.m),
                SizedBox(
                  width: context.textContentWidth,
                  child: SeoText(
                    LocaleKeys.home_page_satisfaction_section_content_p1.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: AppDimens.ss),
                SizedBox(
                  width: context.textContentWidth,
                  child: SeoText(
                    LocaleKeys.home_page_satisfaction_section_content_p2.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                )
              ],
            ),
          ),
          Image(
            width: context.contentWidth - context.textContentWidth,
            height: context.contentHeight,
            image: const AssetImage(Images.shakeHands),
          ),
        ],
      ),
    );
  }
}

class _SatisfactionSectionSmall extends StatelessWidget {
  const _SatisfactionSectionSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: context.contentWidth,
                image: const AssetImage(Images.shakeHands),
              ),
              const SizedBox(height: AppDimens.m),
              SizedBox(
                width: context.contentWidth,
                child: SeoText(
                  LocaleKeys.home_page_satisfaction_section_header.tr(),
                  style: context.h1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: AppDimens.m),
              SizedBox(
                width: context.contentWidth,
                child: SeoText(
                  LocaleKeys.home_page_satisfaction_section_content_p1.tr(),
                  style: AppTypography.body1,
                  textAlign: TextAlign.left,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: AppDimens.m),
              SizedBox(
                width: context.contentWidth,
                child: SeoText(
                  LocaleKeys.home_page_satisfaction_section_content_p2.tr(),
                  style: AppTypography.body1,
                  textAlign: TextAlign.left,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: AppDimens.m),
            ],
          ),
        ),
      ],
    );
  }
}
