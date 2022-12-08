// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
            _ImageSection(
              onFindUsButtonPressed: () => scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            const _SatisfactionSection(),
            const _MapSection(),
          ],
        ),
      ),
    );
  }
}

class _MapSection extends StatelessWidget {
  const _MapSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.contentHeight,
      color: AppColors.gray,
      child: Center(
        child: SizedBox(width: context.contentWidth),
      ),
    );
  }
}

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
                  child: Text(
                    LocaleKeys.home_page_satisfaction_section_header.tr(),
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: AppDimens.m),
                SizedBox(
                  width: context.textContentWidth,
                  child: Text(
                    LocaleKeys.home_page_satisfaction_section_content_p1.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: AppDimens.ss),
                SizedBox(
                  width: context.textContentWidth,
                  child: Text(
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
                child: Text(
                  LocaleKeys.home_page_satisfaction_section_header.tr(),
                  style: context.h1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: AppDimens.m),
              SizedBox(
                width: context.contentWidth,
                child: Text(
                  LocaleKeys.home_page_satisfaction_section_content_p1.tr(),
                  style: AppTypography.body1,
                  textAlign: TextAlign.left,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: AppDimens.m),
              SizedBox(
                width: context.contentWidth,
                child: Text(
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

class _AppBarSection extends HookWidget {
  const _AppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLang = useState<LanguageCode>(LanguageCodeUtils.fromLocale(context.locale));

    return Container(
      width: double.infinity,
      color: AppColors.primary,
      height: 50,
      child: Center(
        child: SizedBox(
          width: context.contentWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  iconEnabledColor: Colors.white,
                  value: currentLang.value,
                  items: LanguageCode.values
                      .map(
                        (e) => DropdownMenuItem<LanguageCode>(
                          value: e,
                          child: _DropDownMenuItemWidget(languageCode: e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) async {
                    final newLanguageCode = value as LanguageCode;

                    await context.setLocale(availableLocales[newLanguageCode] ?? const Locale('pl'));
                    currentLang.value = newLanguageCode;
                    html.window.location.reload();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropDownMenuItemWidget extends StatelessWidget {
  const _DropDownMenuItemWidget({
    required this.languageCode,
    Key? key,
  }) : super(key: key);

  final LanguageCode languageCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          languageCode.flagPath,
          height: 16,
        ),
        const SizedBox(width: AppDimens.ss),
        Text(
          languageCode.languageName,
          style: AppTypography.medium,
        ),
      ],
    );
  }
}

class _NavigationSection extends StatelessWidget {
  const _NavigationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.isScreenSmall ? double.infinity : context.contentWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              alignment: Alignment.centerLeft,
              image: AssetImage(Images.logoSmall),
            ),
            _NavigationButtons(),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (context.screenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
      case ScreenSize.m:
        return const Padding(
          padding: EdgeInsets.only(right: AppDimens.xl),
          child: Icon(Icons.menu),
        );

      default:
        return Row(
          children: HomePageTabEnum.values
              .map(
                (e) => _NavigationButton(
                  name: e.name,
                ),
              )
              .toList(),
        );
    }
  }
}

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
                      child: Text(
                        LocaleKeys.home_page_image_section_header.tr(),
                        style: context.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.m),
                    SizedBox(
                      width: context.textContentWidth,
                      child: Text(
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
            fit: BoxFit.cover,
            image: const AssetImage(Images.steelSheetsSmall),
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
                      child: Text(
                        LocaleKeys.home_page_image_section_header.tr(),
                        style: AppTypography.h1.copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: AppDimens.s),
                    SizedBox(
                      width: 600,
                      child: Text(
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

class _NavigationButton extends HookWidget {
  const _NavigationButton({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.m).copyWith(left: AppDimens.xl),
      child: InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        onHover: (isHovered) {
          hoverState.value = isHovered;
        },
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              name,
              style: AppTypography.h3w400.copyWith(
                shadows: [const Shadow(color: Colors.black, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: hoverState.value ? TextDecoration.underline : null,
                decorationColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
