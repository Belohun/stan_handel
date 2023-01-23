import 'package:flutter/material.dart';

class AppShadows {
  static const cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 3),
    blurRadius: 8,
  );

  static const cardShadowAlternative = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 3),
    blurRadius: 5
  );

  static const smallShadow = BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 3,
    spreadRadius: 1,
    color: Color.fromRGBO(0, 0, 0, 0.1),
  );
}
