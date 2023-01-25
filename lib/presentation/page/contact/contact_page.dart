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
import 'package:stan_handel_web/presentation/widget/section/map_section.dart';
import 'package:stan_handel_web/presentation/widget/text/info.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';

class ContactPage extends HookWidget {
  const ContactPage({super.key});

  static const route = "/contact";

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    return PageBase(
      content: Column(
        children: const [
          _ContactInfoSection(),
          MapSection(),
        ],
      ),
      scrollController: controller,
    );
  }
}


class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray7,
      child: Center(
        child: context.isScreenSmall ? const _ContactInfoSectionSmall() : const _ContactInfoSectionBig(),
      ),
    );
  }
}

class _ContactInfoSectionBig extends StatelessWidget {
  const _ContactInfoSectionBig({
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
          Expanded(
            child: SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeoText(
                    LocaleKeys.contact_page_h1.tr(),
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: AppDimens.s),
                  SeoText(
                    LocaleKeys.contact_page_content_p1.tr(),
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                  const SizedBox(height: AppDimens.xl),
                  const SeoText(
                    "Stan Handel - Tatiana Wójcik",
                    style: AppTypography.body1w500,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                  const SizedBox(height: AppDimens.m),
                  InfoColumnSmall(
                    title: LocaleKeys.contact_page_address.tr(),
                    info: "ul. Mikołowska 27, 43-100 Tychy",
                  ),
                  const SizedBox(height: AppDimens.ss),
                  const InfoColumnSmall(
                    title: "NIP",
                    info: "6481957771",
                  ),
                  const SizedBox(height: AppDimens.ss),
                  const InfoColumnSmall(
                    title: "REGON",
                    info: "276561440",
                  ),
                  const SizedBox(height: AppDimens.ss),
                  InfoColumnSmall(
                    title: LocaleKeys.contact_page_phone.tr(),
                    info: "608 768 507",
                  ),
                  const SizedBox(height: AppDimens.ss),
                  InfoColumnSmall(
                    title: LocaleKeys.contact_page_email.tr(),
                    info: "biuro@stanhandel.pl",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image(
              width: context.contentWidth - context.textContentWidth,
              height: context.bigIconHeight,
              image: const AssetImage(Images.phone),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoSectionSmall extends StatelessWidget {
  const _ContactInfoSectionSmall({
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
              const SizedBox(height: AppDimens.xl),
              Image(
                height: context.bigIconHeight,
                image: const AssetImage(Images.phone),
              ),
              const SizedBox(height: AppDimens.xl),
              SizedBox(
                width: context.contentWidth,
                child: SelectionArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeoText(
                        LocaleKeys.contact_page_h1.tr(),
                        style: context.h1,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: AppDimens.s),
                      SeoText(
                        LocaleKeys.contact_page_content_p1.tr(),
                        style: AppTypography.body1,
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                      const SizedBox(height: AppDimens.xl),
                      const SeoText(
                        "Stan Handel - Tatiana Wójcik",
                        style: AppTypography.body1w500,
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                      const SizedBox(height: AppDimens.m),
                      InfoColumnSmall(
                        title: LocaleKeys.contact_page_address.tr(),
                        info: "ul. Mikołowska 27, 43-100 Tychy",
                      ),
                      const SizedBox(height: AppDimens.ss),
                      const InfoColumnSmall(
                        title: "NIP",
                        info: "6481957771",
                      ),
                      const SizedBox(height: AppDimens.ss),
                      const InfoColumnSmall(
                        title: "REGON",
                        info: "276561440",
                      ),
                      const SizedBox(height: AppDimens.ss),
                      InfoColumnSmall(
                        title: LocaleKeys.contact_page_phone.tr(),
                        info: "608 768 507",
                      ),
                      const SizedBox(height: AppDimens.ss),
                      InfoColumnSmall(
                        title: LocaleKeys.contact_page_email.tr(),
                        info: "biuro@stanhandel.pl",
                      ),
                      const SizedBox(height: AppDimens.xl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
