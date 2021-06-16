import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CloseDialog extends StatelessWidget {
  CloseDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeProvider.themeOf(context).data.canvasColor,
      title: Text(
        'Exit NumCalc',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          color: ThemeProvider.themeOf(context).data.primaryColor,
          height: 1.3,
        ),
      ),
      content: Text(
        'Are you sure to exit?',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          color: ThemeProvider.themeOf(context).data.primaryColor,
          height: 1.3,  
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pop(false);
            }),
          },
          child: Text(
            'no'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              letterSpacing: 1.4,
              color: ThemeProvider.themeOf(context).data.accentColor
            ),
          ),
        ),
        TextButton(
          onPressed: () => {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop(true);
            }),
          },
          child: Text(
            'yes'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              letterSpacing: 1.4,
              color: ThemeProvider.themeOf(context).data.accentColor
            ),
          ),
        ),
      ],
    ) ?? false;
  }
}