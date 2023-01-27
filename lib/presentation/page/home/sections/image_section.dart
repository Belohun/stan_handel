part of '../home_page.dart';

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.onFindUsButtonPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onFindUsButtonPressed;

  @override
  Widget build(BuildContext context) => context.isScreenSmall
      ? _ImageSectionSmall(onFindUsButtonPressed: onFindUsButtonPressed)
      : _ImageSectionBig(onFindUsButtonPressed: onFindUsButtonPressed);
}

class _ImageSectionBig extends StatelessWidget {
  const _ImageSectionBig({
    required this.onFindUsButtonPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onFindUsButtonPressed;

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
            image: const AssetImage(Images.steelSheets),
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
                        LocaleKeys.home_page_image_section_header.tr(),
                        style: context.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.m),
                    SizedBox(
                      width: context.textContentWidth,
                      child: SeoText(
                        LocaleKeys.home_page_image_section_content.tr(),
                        style: AppTypography.body1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(height: AppDimens.xc),
                    PrimaryButton(
                      onPressed: onFindUsButtonPressed,
                      text: LocaleKeys.home_page_image_section_button_text.tr(),
                      suffixWidget: const Icon(Icons.arrow_right_alt_rounded),
                    )
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
    required this.onFindUsButtonPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onFindUsButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image(
            height: context.contentHeight,
            color: Colors.black.withOpacity(0.50),
            colorBlendMode: BlendMode.srcOver,
            fit: BoxFit.cover,
            image: const AssetImage(Images.steelSheets),
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
                        LocaleKeys.home_page_image_section_header.tr(),
                        style: AppTypography.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.s),
                    SizedBox(
                      width: 600,
                      child: SeoText(
                        LocaleKeys.home_page_image_section_content.tr(),
                        style: AppTypography.body1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(height: AppDimens.m),
                    PrimaryButton(
                      onPressed: onFindUsButtonPressed,
                      text: LocaleKeys.home_page_image_section_button_text.tr(),
                      suffixWidget: const Icon(Icons.arrow_right_alt_rounded),
                    )
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
