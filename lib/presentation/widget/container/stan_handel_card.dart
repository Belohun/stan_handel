import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_shadows.dart';

class StanHandelCard extends StatelessWidget {
  const StanHandelCard({
    required this.child,
    this.shadow = AppShadows.cardShadow,
    this.borderRadius = const BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
    this.footer,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final BoxShadow shadow;
  final Widget child;
  final double? height;
  final double? width;
  final Widget? footer;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
          boxShadow: [shadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            if (footer != null)
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppDimens.cardRadius),
                  ),
                  color: AppColors.gray7,
                ),
                child: footer,
              )
          ],
        ),
      );
}
