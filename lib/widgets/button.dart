import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:theme_provider/theme_provider.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) {
          return EdgeInsets.fromLTRB(45, 10, 45, 10);
        }),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return ThemeProvider.themeOf(context).data.accentColor;
        }),
      ),
      child: Text(
        'convert'.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: SizeConfig.textMultiplier * 3.2,
          fontWeight: FontWeight.w300,
          color: ThemeProvider.themeOf(context).data.primaryColor,
          letterSpacing: 2
        ),
      ),
    );
  }
}