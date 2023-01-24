part of '../page_base.dart';

class _FooterSection extends StatelessWidget {
  const _FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: context.contentWidth,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.xxl),
            child: _FooterContentBig(),
          ),
        ),
      ),
    );
  }
}

class _FooterContentBig extends HookWidget {
  const _FooterContentBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(
      () => [
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                LocaleKeys.footer_menu.tr(),
                style: AppTypography.body1w500.copyWith(color: Colors.white),
              ),
              ...HomePageTabEnum.values.map(
                (e) => HoverOnButton(
                  padding: const EdgeInsets.only(top: AppDimens.s),
                  text: e.name,
                  style: AppTypography.body1w300.copyWith(color: Colors.white),
                  onPressed: () => SafeNavigator.pushNamed(context, e.route),
                ),
              ),
            ],
          ),
        ),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                LocaleKeys.footer_office.tr(),
                style: AppTypography.body1w500.copyWith(color: Colors.white),
              ),
              const SizedBox(height: AppDimens.s),
              SeoText(
                "Stan Handel",
                style: AppTypography.body1w300.copyWith(color: Colors.white),
              ),
              SeoText(
                "43-100 Tychy",
                style: AppTypography.body1w300.copyWith(color: Colors.white),
              ),
              SeoText(
                "ul. Mikołowska 272",
                style: AppTypography.body1w300.copyWith(color: Colors.white),
              ),
              const SizedBox(height: AppDimens.s),
              SeoText(
                LocaleKeys.footer_workingHours.tr(),
                style: AppTypography.body1w300.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                LocaleKeys.footer_contact.tr(),
                style: AppTypography.body1w500.copyWith(color: Colors.white),
              ),
              const SizedBox(height: AppDimens.s),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                  const SizedBox(width: AppDimens.s),
                  SeoText(
                    "+48 608 768 507 ",
                    style: AppTypography.body1w300.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.s),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                  const SizedBox(width: AppDimens.s),
                  SeoText(
                    "+48 608 768 507",
                    style: AppTypography.body1w300.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.s),
              Row(
                children: [
                  const Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  const SizedBox(width: AppDimens.s),
                  SeoText(
                    "biuro@stanhandel.pl",
                    style: AppTypography.body1w300.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    if (context.isScreenSmall) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
