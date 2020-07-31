import 'package:flutter/material.dart';

MaterialButton buildButton({Color backgroundColor, Widget child, Function onPress}) {
  return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      color: backgroundColor,
      height: 43,
      child: child);
}
