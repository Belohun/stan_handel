import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeoText(
              title,
              style: AppTypography.big.copyWith(color: AppColors.gray2),
            ),
            const SizedBox(height: AppDimens.s),
            SeoText(
              info,
              style: AppTypography.h3w400.copyWith(height: 1),
            )
          ],
        ),
      ),
    );
  }
}


class InfoColumnSmall extends StatelessWidget {
  const InfoColumnSmall({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeoText(
          title,
          style: AppTypography.medium.copyWith(color: AppColors.gray2),
        ),
        const SizedBox(height: AppDimens.ms),
        SeoText(
          info,
          style: AppTypography.body1.copyWith( height: 1),
        )
      ],
    );
  }
}