import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Icon prefixIcon;
  final String hintText;
  final Stream<String> stream;
  final Function(String) onChanged;
  final bool isPassword;

  MyTextField({
    Key key,
    @required this.prefixIcon,
    @required this.hintText,
    @required this.stream,
    @required this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText;

  void _onVisibilityButtonPressed() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            errorText: snapshot.error,
            suffixIcon: widget.isPassword
                ? FlatButton(
                    onPressed: _onVisibilityButtonPressed,
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
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
          onChanged: widget.onChanged,
          obscureText: _obscureText,
        );
      },
    );
  }
}
