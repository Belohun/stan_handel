part of '../../../main_page.dart';

class _NavigationSection extends HookWidget {
  const _NavigationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<NavigationSectionCubit>();
    final state = useBlocBuilder(cubit);

    return Column(
      children: [
        Center(
          child: SizedBox(
            width: context.isScreenSmall ? double.infinity : context.contentWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(Images.logoSmall),
                ),
                _NavigationButtons(
                  cubit: cubit,
                  state: state,
                ),
              ],
            ),
          ),
        ),
        context.showNavigationMenu ? _NavigationMenu(state: state) : const SizedBox.shrink()
      ],
    );
  }
}

class _NavigationMenu extends StatefulHookWidget {
  const _NavigationMenu({
    required this.state,
    Key? key,
  }) : super(key: key);

  final NavigationSectionState state;

  @override
  State<_NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<_NavigationMenu> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (widget.state.isNavigationMenuOpened) {
        controller.forward(from: 0);
      } else if (!widget.state.isNavigationMenuOpened) {
        controller.reverse(from: 1);
      }
      return null;
    }, [widget.state]);

    return SizedBox(
      width: double.infinity,
      child: SizeTransition(
        sizeFactor: animation,
        child: Container(
          width: double.infinity,
          color: AppColors.primaryDark,
          child: const _NavigationMenuContent(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class _NavigationMenuContent extends StatelessWidget {
  const _NavigationMenuContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: HomePageTabEnum.values.map((e) => _NavigationMenuItem(tab: e)).toList());
  }
}

class _NavigationMenuItem extends StatefulHookWidget {
  const _NavigationMenuItem({
    required this.tab,
    Key? key,
  }) : super(key: key);

  final HomePageTabEnum tab;

  @override
  State<_NavigationMenuItem> createState() => _NavigationMenuItemState();
}

class _NavigationMenuItemState extends State<_NavigationMenuItem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final isExtended = useState(false);

    final animationController = useAnimationController(
      duration: AppDimens.iconTransitionDuration,
      vsync: this,
    );

    final Animation<double> subMenuAnimation = useMemoized(
      () {
        return Tween<double>(begin: 0, end: 1).animate(animationController);
      },
      [context],
    );
    final Animation<double> iconAnimation = useMemoized(
      () {
        return Tween<double>(begin: 0, end: 0.5).animate(animationController);
      },
      [context],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimens.m),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.tab.name,
                style: AppTypography.xl.copyWith(color: Colors.white),
              ),
              if (widget.tab.menuTabItems.isNotEmpty) ...[
                const VerticalDivider(
                  color: Colors.white,
                  width: 1.5,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (isExtended.value) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                    isExtended.value = !isExtended.value;
                  },
                  child: RotationTransition(
                    turns: iconAnimation,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ],
          ),
        ),
        ...widget.tab.menuTabItems.map((e) => SizeTransition(
              sizeFactor: subMenuAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.l,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.white, height: 0.75),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.m,
                      ),
                      child: Text(
                        e.name,
                        style: AppTypography.xl.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        const Divider(
          color: Colors.white,
          height: 0.75,
        ),
      ],
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.cubit,
    required this.state,
    Key? key,
  }) : super(key: key);

  final NavigationSectionCubit cubit;
  final NavigationSectionState state;

  @override
  Widget build(BuildContext context) {
    if (context.showNavigationMenu) {
      return _NavigationMenuIcon(
        cubit: cubit,
        state: state,
      );
    }

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

class _NavigationMenuIcon extends StatefulHookWidget {
  const _NavigationMenuIcon({
    required this.state,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final NavigationSectionCubit cubit;
  final NavigationSectionState state;

  @override
  State<_NavigationMenuIcon> createState() => _NavigationMenuIconState();
}

class _NavigationMenuIconState extends State<_NavigationMenuIcon> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: AppDimens.textUnderlineDuration,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (widget.state.isNavigationMenuOpened) {
        controller.forward(from: 0);
      } else if (!widget.state.isNavigationMenuOpened) {
        controller.reverse(from: 1);
      }
      return null;
    }, [widget.state]);

    return CupertinoButton(
      padding: const EdgeInsets.only(right: AppDimens.xl),
      onPressed: () {
        if (controller.value == 0) {
          widget.cubit.changeNavigationMenuState(true);
        } else if (controller.value == 1) {
          widget.cubit.changeNavigationMenuState(false);
        }
      },
      child: AnimatedIcon(
        color: AppColors.primaryDark,
        size: AppDimens.iconSize,
        icon: AnimatedIcons.menu_close,
        progress: animation,
      ),
    );
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

extension on BuildContext {
  bool get showNavigationMenu {
    switch (screenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
      case ScreenSize.m:
        return true;

      default:
        return false;
    }
  }
}
