import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get topSafeArea => MediaQuery.of(this).padding.top;

  double get bottomSafeArea => MediaQuery.of(this).padding.bottom;

  TextTheme get textStyle => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;
}
