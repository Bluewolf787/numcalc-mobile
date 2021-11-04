import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.controller,
    this.labelText,
    this.hintText,
    this.onPressedClear,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function onPressedClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(Icons.delete_outline_rounded),
          color: ThemeProvider.themeOf(context).data.primaryColor,
          tooltip: 'Clear input',
          onPressed: onPressedClear,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ThemeProvider.themeOf(context).data.accentColor,
            width: 2.0
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ThemeProvider.themeOf(context).data.accentColor,
            width: 2.0
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: ThemeProvider.themeOf(context).data.primaryColor,
          fontWeight: FontWeight.w300,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: ThemeProvider.themeOf(context).data.primaryColor,
          fontWeight: FontWeight.w300,
        ),
      ),
      cursorColor: ThemeProvider.themeOf(context).data.accentColor,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: ThemeProvider.themeOf(context).data.primaryColor,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}