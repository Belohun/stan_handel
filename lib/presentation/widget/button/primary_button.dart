import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    this.onPressed,
    this.insidePadding = const EdgeInsets.symmetric(vertical: AppDimens.m, horizontal: AppDimens.xl),
    this.suffixWidget,
    this.radius = const BorderRadius.all(
      Radius.circular(AppDimens.primaryButtonRadius),
    ),
    Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets insidePadding;
  final Widget? suffixWidget;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: AppDimens.zero,
      borderRadius: radius,
      color: AppColors.primary,
      onPressed: onPressed,
      child: Container(
        padding: insidePadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTypography.big.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (suffixWidget != null) ...[
              const SizedBox(width: AppDimens.xl),
              suffixWidget!,
            ],
          ],
        ),
      ),
    );
  }
}
