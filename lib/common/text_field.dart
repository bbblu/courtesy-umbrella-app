import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final Stream<String> stream;
  final Function(String) onChanged;
  final bool isReadOnly;
  final bool isPassword;
  final TextEditingController controller;

  MyTextField({
    Key key,
    @required this.prefixIcon,
    @required this.hintText,
    @required this.stream,
    this.onChanged,
    this.isReadOnly = false,
    this.isPassword = false,
    this.controller,
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
        return Theme(
          data: ThemeData(
            primaryColor: Colors.black,
            primaryColorDark: Colors.black,
            hintColor: Colors.grey,
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 24.0, right: 8.0),
                child: Icon(widget.prefixIcon),
              ),
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
              contentPadding: EdgeInsets.symmetric(vertical: 16.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
            onChanged: widget.onChanged,
            readOnly: widget.isReadOnly,
            obscureText: _obscureText,
            controller: widget.controller,
          ),
        );
      },
    );
  }
}
