import 'package:flutter/cupertino.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

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
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
