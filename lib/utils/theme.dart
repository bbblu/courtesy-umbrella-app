import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: MyColorScheme.primary1,
  accentColor: MyColorScheme.primary5,
  backgroundColor: Color(0xFFFBFBFB),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: MyColorScheme.primary1,
  accentColor: MyColorScheme.primary5,
);
