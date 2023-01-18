part of '../calculator_page.dart';

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => context.isScreenSmall ? const _ImageSectionSmall() : const _ImageSectionBig();
}

class _ImageSectionBig extends StatelessWidget {
  const _ImageSectionBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image(
            height: context.contentHeight,
            width: double.infinity,
            color: Colors.black.withOpacity(0.50),
            colorBlendMode: BlendMode.srcOver,
            fit: BoxFit.fitWidth,
            image: const AssetImage(Images.steelSheetsStack),
          ),
        ),
        Center(
          child: SizedBox(
            height: context.contentHeight,
            width: context.contentWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
              child: SelectionArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimens.m),
                    SizedBox(
                      width: context.textContentWidth,
                      child: SeoText(
                        LocaleKeys.calculator_page_image_section_header.tr(),
                        style: context.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.m),
                    SizedBox(
                      width: context.textContentWidth,
                      child: SeoText(
                        LocaleKeys.calculator_page_image_section_content.tr(),
                        style: AppTypography.body1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageSectionSmall extends StatelessWidget {
  const _ImageSectionSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image(
            color: Colors.black.withOpacity(0.50),
            colorBlendMode: BlendMode.srcOver,
            height: context.contentHeight,
            fit: BoxFit.cover,
            image: const AssetImage(Images.steelSheetsStack),
          ),
        ),
        Center(
          child: SizedBox(
            height: context.contentHeight,
            width: context.contentWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
              child: SelectionArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimens.s),
                    SizedBox(
                      width: 600,
                      child: SeoText(
                        LocaleKeys.calculator_page_image_section_header.tr(),
                        style: AppTypography.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.s),
                    SizedBox(
                      width: 600,
                      child: SeoText(
                        LocaleKeys.calculator_page_image_section_content.tr(),
                        style: AppTypography.body1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
