import 'package:flutter/material.dart';

extension MyColors on Colors {
  static const Color primary1 = Color(0xFF69BD83);

  static const Color primary2 = Color(0xFFC4D700);

  static const Color primary3 = Color(0xFF31B381);

  static const Color primary4 = Color(0xFFF04132);

  static const Color primary5 = Color(0xFFEBCB5F);

  static const greenGradient = LinearGradient(
    stops: [0, 0.75, 1],
    colors: [MyColors.primary1, Color(0xFF9BCB3B), MyColors.primary2],
  );

  static const redGradient = LinearGradient(
    colors: [MyColors.primary4, MyColors.primary5],
  );
}
