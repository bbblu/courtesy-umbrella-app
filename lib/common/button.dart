import 'package:flutter/material.dart';

import '../resources/resources.dart';

class MyFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MyFlatButton({
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
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 7.0),
        color: MyColors.primary2,
        disabledColor: Colors.grey,
        textColor: Colors.white,
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MyTextButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.blueAccent),
      ),
      onPressed: onPressed,
    );
  }
}
