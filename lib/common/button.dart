import 'package:flutter/material.dart';

import '../resources/resources.dart';

class MyFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Stream<bool> stream;
  final Gradient color;

  MyFlatButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.stream,
    this.color = MyColors.greenGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Container(
          decoration: snapshot.hasData
              ? BoxDecoration(
                  gradient: color,
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

class MySmallFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  MySmallFlatButton({
    @required this.onPressed,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          '歸還',
          style: TextStyle(fontSize: 24.0),
        ),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 0.0,
        ),
      ),
    );
  }
}
