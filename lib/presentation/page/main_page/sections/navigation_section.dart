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
                  tab: e,
                ),
              )
              .toList(),
        );
    }
  }
}

class _NavigationButton extends HookWidget {
  const _NavigationButton({
    required this.tab,
    Key? key,
  }) : super(key: key);

  final HomePageTabEnum tab;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.m)
          .copyWith(left: AppDimens.xl),
      child: MouseRegion(

        onEnter: (_) {
          hoverState.value = true;
        },
        onExit: (_) {
          hoverState.value = false;
        },
        child: PortalTarget(
          visible: hoverState.value,
          anchor: const Aligned(
            follower: Alignment.topCenter,
            target: Alignment.bottomCenter,
          ),
          portalFollower: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: tab.menuTabItems
                  .map((e) => SeoText(
                        TabMenuUtils.getName(e),
                        style: AppTypography.h3w400,
                      ))
                  .toList(),
            ),
          ),
          child: SeoText(
            tab.name,
            style: AppTypography.h3w400.copyWith(
              shadows: [
                const Shadow(color: Colors.black, offset: Offset(0, -5))
              ],
              color: Colors.transparent,
              decoration: hoverState.value ? TextDecoration.underline : null,
              decorationColor: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
