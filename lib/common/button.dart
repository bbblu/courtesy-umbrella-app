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
        return SizedBox(
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
            padding: EdgeInsets.symmetric(vertical: 7.0),
            color: MyColors.primary2,
            disabledColor: Colors.grey,
            textColor: Colors.white,
          ),
        );
      },
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
