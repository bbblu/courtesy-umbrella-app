import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller;

  LoginTextField({
    Key key,
    @required this.prefixIcon,
    @required this.hintText,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
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
      controller: controller,
      obscureText: true,
    );
  }
}
