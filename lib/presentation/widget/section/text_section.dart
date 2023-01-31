import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    required this.header,
    required this.content,
    this.background = Colors.white,
    this.reversed = false,
    this.imagePath,
    super.key,
  });

  final String header;
  final String content;
  final Color background;
  final String? imagePath;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: context.isScreenSmall
          ? _TextSectionSmall(
              header: header,
              content: content,
              background: background,
              imagePath: imagePath,
            )
          : _TextSectionBig(
              header: header,
              content: content,
              background: background,
              imagePath: imagePath,
              reversed: reversed,
            ),
    );
  }
}

class _TextSectionBig extends StatelessWidget {
  const _TextSectionBig({
    required this.header,
    required this.content,
    required this.background,
    required this.imagePath,
    required this.reversed,
    Key? key,
  }) : super(key: key);

  final String header;
  final String content;
  final Color background;
  final String? imagePath;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      width: double.infinity,
      constraints: BoxConstraints(minHeight: context.contentHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SeoText(
                          header,
                          style: context.h1,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: AppDimens.s),
                        SeoText(
                          content,
                          style: AppTypography.body1,
                          textAlign: TextAlign.left,
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                  if (!context.isScreenSmall)
                    imagePath == null
                        ? const Spacer()
                        : Expanded(
                            child: Image(
                              height: context.bigIconHeight,
                              fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                              image: AssetImage(imagePath!),
                            ),
                          ),
                ].reverseList(reversed),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TextSectionSmall extends StatelessWidget {
  const _TextSectionSmall({
    required this.header,
    required this.content,
    required this.background,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final String header;
  final String content;
  final Color background;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      width: double.infinity,
      constraints: BoxConstraints(minHeight: context.contentHeight),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
            child: SizedBox(
              width: context.contentWidth,
              child: Column(
                children: [
                  if (imagePath != null) ...[
                    Image(
                      height: context.bigIconHeight,
                      fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                      image: AssetImage(imagePath!),
                    ),
                    const SizedBox(height: AppDimens.xl),
                  ],
                  SeoText(
                    header,
                    style: context.h1,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: AppDimens.s),
                  SeoText(
                    content,
                    style: AppTypography.body1,
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension _IterableExtension<T> on List<T> {
  List<T> reverseList(bool shouldReverse) {
    if (!shouldReverse) return this;

    return reversed.toList();
  }
}
