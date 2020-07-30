import 'package:flutter/material.dart';

TextFormField inputBox({String hintText, BuildContext context, TextEditingController controller, bool isPassword = false, Function onTap}) {
  return TextFormField(
    onTap: onTap,
    obscureText: isPassword,
    controller: controller,
    cursorColor: Colors.black,
    cursorRadius: Radius.circular(8),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 28),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16, color: Color(0xFFBDBDBD), fontWeight: FontWeight.bold),
      filled: true,
      focusColor: Color(0xFFF1F1F1),
      fillColor: Color(0xFFF1F1F1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(
          color: Color(0xFFF1F1F1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(
          color: Color(0xFFF1F1F1),
        ),
      ),
      isDense: true,
    ),
  );
}
