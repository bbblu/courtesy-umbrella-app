import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final Stream<String> stream;
  final Function(String) onChanged;
  final bool obscureText;

  MyTextFormField({
    Key key,
    @required this.prefixIcon,
    @required this.hintText,
    @required this.stream,
    @required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            errorText: snapshot.error,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            filled: true,
            fillColor: Colors.grey[300].withOpacity(0.5),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          obscureText: obscureText,
          onChanged: onChanged,
        );
      },
    );
  }
}
