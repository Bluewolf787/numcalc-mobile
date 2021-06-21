import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BinaryTable extends StatelessWidget {
  const BinaryTable({
    Key key,
    @required this.calculation,
    @required this.rest,
    @required this.interimResult,
  }) : super(key: key);

  final String calculation;
  final String rest;
  final String interimResult;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: ThemeProvider.themeOf(context).data.dividerColor,
          style: BorderStyle.solid,
        ),
        verticalInside: BorderSide(
          width: 1,
          color: ThemeProvider.themeOf(context).data.dividerColor,
          style: BorderStyle.solid,
        ),
      ),
      defaultColumnWidth: FlexColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Center(
              child: Text(
                'calculation'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                'rest'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                'interim result'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  calculation.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  rest.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  interimResult.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FourRowTable extends StatelessWidget {
  const FourRowTable({
    Key key,
    @required this.powerCalc,
    @required this.restCalc,
    @required this.rest,
    @required this.interimResult,
  }) : super(key: key);

  final String powerCalc;
  final String restCalc;
  final String rest;
  final String interimResult;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: ThemeProvider.themeOf(context).data.dividerColor,
          style: BorderStyle.solid,
        ),
        verticalInside: BorderSide(
          width: 1,
          color: ThemeProvider.themeOf(context).data.dividerColor,
          style: BorderStyle.solid,
        ),
      ),
      defaultColumnWidth: FlexColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Center(
              child: Text(
                'power calculation'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                'rest calculation'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                'rest'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                'interim result\t'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  powerCalc.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  restCalc.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  rest.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Center(
                child: Text(
                  interimResult.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}