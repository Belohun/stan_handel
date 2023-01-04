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

class _NavigationButtons extends StatefulWidget {
  const _NavigationButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<_NavigationButtons> createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<_NavigationButtons> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    switch (context.screenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
      case ScreenSize.m:
        return Padding(
          padding: const EdgeInsets.only(right: AppDimens.xl),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (controller.value == 0) {
                controller.forward(from: 0);
              } else if (controller.value == 1) {
                controller.reverse(from: 1);
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: animation,
            ),
          ),
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

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: AppDimens.textUnderlineDuration,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }
}

class _NavigationButton extends StatefulHookWidget {
  const _NavigationButton({
    required this.tab,
    Key? key,
  }) : super(key: key);

  final HomePageTabEnum tab;

  @override
  State<_NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<_NavigationButton> with TickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);
    final hoverMenuState = useState(false);

    final animationController = useAnimationController(
      vsync: this,
      duration: AppDimens.textUnderlineDuration,
    );
    final curve = useAnimation(
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut)));

    useMemoized(
      () {
        final newIsHovered = hoverState.value || hoverMenuState.value;

        if (newIsHovered == isHovered) return;

        if (newIsHovered) {
          animationController.forward(from: 0);
        } else {
          animationController.reverse(from: 1);
        }
        isHovered = newIsHovered;
      },
      [
        hoverState.value,
        hoverMenuState.value,
      ],
    );

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        //TODO add navigation
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.m).copyWith(left: AppDimens.xl),
        child: MouseRegion(
          onEnter: (_) {
            hoverState.value = true;
          },
          onExit: (_) {
            hoverState.value = false;
          },
          child: PortalTarget(
            visible: isHovered,
            anchor: const Aligned(
              follower: Alignment.topCenter,
              target: Alignment.bottomCenter,
            ),
            portalFollower: MouseRegion(
                onEnter: (_) {
                  hoverMenuState.value = true;
                },
                onExit: (_) {
                  hoverMenuState.value = false;
                },
                child: _SubMenu(tab: widget.tab)),
            child: Stack(
              children: [
                SeoText(
                  widget.tab.name,
                  style: AppTypography.xl,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  transform: Matrix4.identity()..scale(curve, 1.0),
                  child: Text(
                    widget.tab.name,
                    style: AppTypography.xl.copyWith(
                      color: Colors.transparent,
                      decorationColor: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubMenu extends StatelessWidget {
  const _SubMenu({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final HomePageTabEnum tab;

  @override
  Widget build(BuildContext context) {
    if (tab.menuTabItems.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.m).copyWith(top: AppDimens.xl),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimens.m),
        ),
      ),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: tab.menuTabItems
              .map(
                (e) => _SubMenuItem(item: e),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _SubMenuItem extends HookWidget {
  const _SubMenuItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  final TabMenuEnumBase item;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        //TODO add navigation
      },
      child: MouseRegion(
        onEnter: (_) {
          hoverState.value = true;
        },
        onExit: (_) {
          hoverState.value = false;
        },
        child: Container(
          width: double.infinity,
          color: hoverState.value ? AppColors.primaryLight.withOpacity(0.25) : Colors.white,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hoverState.value) ...[
                  Container(
                    width: AppDimens.ms,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppDimens.ss),
                ] else
                  const SizedBox(width: AppDimens.m),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.s),
                  child: SeoText(
                    item.name,
                    style: AppTypography.xl,
                  ),
                ),
                const SizedBox(width: AppDimens.m),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
