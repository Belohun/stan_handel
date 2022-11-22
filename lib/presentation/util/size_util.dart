import 'package:flutter/cupertino.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/screen_size.dart';

extension ScreenSizeContexExtension on BuildContext {
  ScreenSize get screenSize {
    final screenWidth = MediaQuery
        .of(this)
        .size
        .width;

    if (screenWidth >= 1200) {
      return ScreenSize.xl;
    } else if (screenWidth >= 992) {
      return ScreenSize.l;
    } else if (screenWidth >= 768) {
      return ScreenSize.m;
    } else if (screenWidth >= 576) {
      return ScreenSize.s;
    } else {
      return ScreenSize.xs;
    }
  }

  double get contentWidth {
    final currentScreenSize = screenSize;
    final mediaSize = MediaQuery
        .of(this)
        .size
        .width;
    switch (currentScreenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
      case ScreenSize.m:
        return mediaSize * 0.85;
      case ScreenSize.l:
        return 960;
      case ScreenSize.xl:
        return 1140;
    }
  }

  bool get isScreenSmall {
    switch (screenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
        return true;
      default:
        return false;
    }
  }

  double get contentHeight {
    return 600;
  }

  double get textContentWidth {
    if (isScreenSmall) return contentWidth;

    return contentWidth / 2;
  }

  TextStyle get h1 {
    switch (screenSize) {
      case ScreenSize.xs:
      case ScreenSize.s:
      case ScreenSize.m:
        return AppTypography.h1;
      default:
        return AppTypography.appTitle;
    }

  }
}

