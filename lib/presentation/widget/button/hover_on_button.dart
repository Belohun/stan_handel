import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';

class HoverOnButton extends StatefulHookWidget {
  const HoverOnButton({
    required this.text,
    required this.onPressed,
    this.style = AppTypography.xl,
    this.portalTarget = const SizedBox.shrink(),
    this.underlineColor = AppColors.primary,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget portalTarget;
  final TextStyle style;
  final Color underlineColor;
  final EdgeInsets? padding;

  @override
  State<HoverOnButton> createState() => _HoverOnButtonState();
}

class _HoverOnButtonState extends State<HoverOnButton>
    with TickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);
    final hoverMenuState = useState(false);

    final animationController = useAnimationController(
      vsync: this,
      duration: AppDimens.textUnderlineDuration,
    );
    final curve = useAnimation(Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)));

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
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: AppDimens.m)
          .copyWith(left: AppDimens.xl),
      onPressed: widget.onPressed,
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
            child: widget.portalTarget,
          ),
          child: Stack(
            children: [
              SeoText(
                widget.text,
                style: widget.style,
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                transform: Matrix4.identity()..scale(curve, 1.0),
                child: Text(
                  widget.text,
                  style: widget.style.copyWith(
                    color: Colors.transparent,
                    decorationColor: widget.underlineColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
