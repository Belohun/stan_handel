part of '../main_page.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xxl),
            child: context.isScreenSmall ? const _FooterContentSmall() : const _FooterContentBig(),
          ),
        ),
      ),
    );
  }
}

class _FooterContentBig extends StatelessWidget {
  const _FooterContentBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                "Menu",
                style: AppTypography.body1w500.copyWith(color: Colors.white),
              ),
              ...HomePageTabEnum.values.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: AppDimens.s),
                  child: SeoText(
                    e.name,
                    style: AppTypography.body1w300.copyWith(color: Colors.white),
                  ),
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
                "Biuro",
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
                "Czynne: pon-pt 8:00 - 16:00",
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
                "Kontakt",
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
  }
}

class _FooterContentSmall extends StatelessWidget {
  const _FooterContentSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                "Menu",
                style: AppTypography.body1w500.copyWith(color: Colors.white),
              ),
              ...HomePageTabEnum.values.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: AppDimens.s),
                  child: SeoText(
                    e.name,
                    style: AppTypography.body1w300.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.xl),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                "Biuro",
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
                "Czynne: pon-pt 8:00 - 16:00",
                style: AppTypography.body1w300.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.xl),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoText(
                "Kontakt",
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
  }
}
