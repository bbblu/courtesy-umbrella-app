import 'package:flutter/material.dart';

import 'colors.dart';

Brightness appBrightness;

final Map<Symbol, dynamic> myThemeData = {
  Symbol('primaryColor'): MyColors.primary1,
  Symbol('accentColor'): MyColors.primary2,
};

final ThemeData theme = Function.apply(ThemeData.light().copyWith, [], {
  ...myThemeData,
  Symbol('scaffoldBackgroundColor'): Color(0xFFFBFBFB),
});

final ThemeData darkTheme = Function.apply(ThemeData.dark().copyWith, [], {
  ...myThemeData,
});

Color getThemeColor(Color lightColor, Color darkColor) {
  return appBrightness == Brightness.light ? lightColor : darkColor;
}
