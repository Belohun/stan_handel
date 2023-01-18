import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/core/extension/double_extension.dart';

class StanHandelTextField extends HookWidget {
  const StanHandelTextField({
    Key? key,
    this.errorText,
    this.hintText,
    this.maxLines = 1,
    this.disabled = false,
    this.textEditingController,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.labelText,
    this.initText,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppDimens.m,
      vertical: AppDimens.m,
    ),
    this.floatingLabel = true,
    this.suffix,
    this.textInputType,
    this.autofocus = false,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
  }) : super(key: key);

  final String? hintText;
  final bool disabled;
  final TextEditingController? textEditingController;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final Function(String text)? onChanged;
  final String? labelText;
  final bool autofocus;
  final bool floatingLabel;
  final Widget? suffix;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry contentPadding;
  final String? errorText;
  final int? maxLines;
  final String? initText;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

  StanHandelTextField.numberInput({
    this.errorText,
    this.hintText,
    this.maxLines = 1,
    this.disabled = false,
    this.textEditingController,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.labelText,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppDimens.m,
      vertical: AppDimens.ss,
    ),
    this.floatingLabel = true,
    this.suffix,
    this.autofocus = false,
    this.textAlign = TextAlign.left,
    bool fractionsAlwaysVisible = false,
    bool allowDecimals = false,
    double? initNumber,
    Key? key,
  })  : initText = initNumber.safeFormattedString(fractionsAlwaysVisible: fractionsAlwaysVisible),
        textInputType = TextInputType.numberWithOptions(decimal: allowDecimals),
        inputFormatters = allowDecimals ? null : [FilteringTextInputFormatter.digitsOnly],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized<TextEditingController?>(() {
      if (textEditingController == null && initText != null) {
        return TextEditingController(text: initText);
      } else if (textEditingController != null && initText != null) {
        textEditingController!.text = initText!;
      }
      return textEditingController;
    }, [textEditingController, key]);

    return TextField(
      inputFormatters: inputFormatters,
      textAlign: textAlign,
      maxLines: maxLines,
      autofocus: autofocus,
      focusNode: disabled ? AlwaysDisabledFocusNode() : null,
      onTap: onTap,
      controller: controller,
      enableInteractiveSelection: !disabled,
      cursorColor: AppColors.gray3,
      keyboardType: textInputType,
      style: AppTypography.big.copyWith(color: AppColors.darkBlue),
      decoration: InputDecoration(
        errorMaxLines: 2,
        floatingLabelBehavior: floatingLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
        contentPadding: contentPadding,
        isDense: true,
        alignLabelWithHint: false,
        labelText: labelText,
        labelStyle: AppTypography.big.copyWith(color: AppColors.gray2, height: 0.5),
        hintText: hintText,
        hintStyle: AppTypography.medium.copyWith(color: AppColors.gray2),
        fillColor: AppColors.gray7,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffix != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [suffix!],
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.cardRadius),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.cardRadius),
          ),
          borderSide: BorderSide.none,
        ),
        errorBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.cardRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.red,
            width: AppDimens.xxs,
          ),
        ),
        errorText: errorText,
        errorStyle: AppTypography.medium.copyWith(color: AppColors.red),
      ),
      onChanged: onChanged,
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
