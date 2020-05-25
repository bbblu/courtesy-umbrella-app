import 'package:flutter/material.dart';

import '../resources/resources.dart';

class MyFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Stream<bool> stream;

  MyFlatButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Container(
          decoration: snapshot.hasData
              ? BoxDecoration(
                  gradient: MyColors.greenGradient,
                  borderRadius: BorderRadius.circular(50.0),
                )
              : null,
          child: SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: snapshot.hasData ? onPressed : null,
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
              padding: EdgeInsets.symmetric(vertical: 8.0),
              disabledColor: Colors.grey,
              textColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

class MyTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  MyTextButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(color: this.color),
      ),
      onPressed: onPressed,
    );
  }
}
