import 'package:flutter/material.dart';

TextFormField inputBox(
    {String hintText,
    BuildContext context,
    TextEditingController controller,
    bool isPassword = false,
    Function onTap,
    TextCapitalization capital,
    Function onChanged,
    bool maxLength = false,
    int maxValue,
    bool validate = false,
    TextInputType textInputType,
    String errorText}) {
  return TextFormField(
    keyboardType: textInputType ?? TextInputType.text,
    maxLengthEnforced: maxLength,
    maxLength: maxValue,
    textCapitalization: capital ?? TextCapitalization.none,
    onChanged: onChanged,
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
      errorText: validate ? errorText : null,
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
