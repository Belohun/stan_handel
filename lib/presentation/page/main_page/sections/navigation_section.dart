part of '../main_page.dart';

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
            SeoText(
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
