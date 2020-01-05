import 'package:flutter/material.dart';

class TextDecoration extends InputDecoration {
  final IconData iconData;
  final String hint;

  TextDecoration({
    this.iconData,
    this.hint
  }) : super(
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(iconData),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue[200], width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),

    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),

    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue[200], width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),
  );
}