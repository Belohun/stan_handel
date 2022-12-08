part of '../main_page.dart';

class _AppBarSection extends HookWidget {
  const _AppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLang = useState<LanguageCode>(LanguageCodeUtils.fromLocale(context.locale));

    return Container(
      width: double.infinity,
      color: AppColors.primary,
      height: 50,
      child: Center(
        child: SizedBox(
          width: context.contentWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const Spacer(),
              _LanguageMenu(currentLang: currentLang),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageMenu extends StatefulHookWidget {
  const _LanguageMenu({
    Key? key,
    required this.currentLang,
  }) : super(key: key);

  final ValueNotifier<LanguageCode> currentLang;

  @override
  State<_LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<_LanguageMenu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: AppDimens.iconTransitionDuration,
      vsync: this,
    );

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        onMenuStateChange: (isOpened) {
          if (isOpened) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
        customButton: _DropDownMenuSelectedItemWidget(
          languageCode: widget.currentLang.value,
          animationController: animationController,
        ),
        iconEnabledColor: Colors.white,
        value: widget.currentLang.value,
        items: LanguageCode.values
            .map(
              (languageCode) => DropdownMenuItem<LanguageCode>(
                value: languageCode,
                child: _DropDownMenuItemWidget(languageCode: languageCode),
              ),
            )
            .toList(),
        onChanged: (value) async {
          final newLanguageCode = value as LanguageCode;

          await context.setLocale(availableLocales[newLanguageCode] ?? const Locale('pl'));
          widget.currentLang.value = newLanguageCode;
          html.window.location.reload();
        },
      ),
    );
  }
}

class _DropDownMenuItemWidget extends StatelessWidget {
  const _DropDownMenuItemWidget({
    required this.languageCode,
    Key? key,
  }) : super(key: key);

  final LanguageCode languageCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          languageCode.flagPath,
          height: AppDimens.m,
        ),
        const SizedBox(width: AppDimens.ss),
        SeoText(languageCode.languageName, style: AppTypography.medium),
      ],
    );
  }
}

class _DropDownMenuSelectedItemWidget extends HookWidget {
  const _DropDownMenuSelectedItemWidget({
    required this.animationController,
    required this.languageCode,
    Key? key,
  }) : super(key: key);

  final LanguageCode languageCode;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = useMemoized(
      () {
        return Tween<double>(begin: 0, end: 0.5).animate(animationController);
      },
      [context],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: Row(
        children: [
          SvgPicture.asset(
            languageCode.flagPath,
            height: AppDimens.m,
          ),
          const SizedBox(width: AppDimens.ss),
          SeoText(
            languageCode.languageName,
            style: AppTypography.medium.copyWith(color: Colors.white),
          ),
          const SizedBox(width: AppDimens.m),
          RotationTransition(
            turns: animation,
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
