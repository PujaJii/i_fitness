import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgets {
  static Widget textView(String text, Color colors, double fontSize,
          {FontWeight? fontWeight}) =>
      Text(
        text,
        style: TextStyle(
            color: colors, fontSize: fontSize, fontWeight: fontWeight),
      );

}
