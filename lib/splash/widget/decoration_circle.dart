import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class DecorationCircle extends StatelessWidget {
  final double size;

  DecorationCircle({
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: MyColors.greenGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
