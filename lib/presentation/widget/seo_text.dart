import 'package:flutter/cupertino.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';

class SeoText extends StatelessWidget {
  const SeoText(
    this.text, {
    this.style,
    this.textAlign,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextRenderer(
      child: AnimatedDefaultTextStyle(
        curve: Curves.bounceIn,
        style: style ?? AppTypography.body1,
        duration: AppDimens.iconTransitionDuration,
        child: Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
