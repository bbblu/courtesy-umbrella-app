import 'package:flutter/material.dart';

import '../../utils/color_scheme.dart';

class LoginFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  LoginFlatButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: MyColorScheme.primary2,
        textColor: Colors.white,
      ),
    );
  }
}

class LoginTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  LoginTextButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: onPressed,
    );
  }
}
