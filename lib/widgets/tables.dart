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
                  calculation,
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
                  rest,
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
                  interimResult,
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

class OneColumnTable extends StatelessWidget {
  const OneColumnTable({
    Key key,
    @required this.calculation,
  }) : super(key: key);

  final String calculation;

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
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              heightFactor: 4,
              child: Text(
                calculation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
              ),
            ),
          ]
        )
      ],
    );
  }
}

class ThreeColumnTable extends StatelessWidget {
  const ThreeColumnTable({
    Key key,
    @required this.firstColumnHead,
    @required this.firstColumnBody,
    @required this.secondColumnHead,
    @required this.secondColumnBody,
    @required this.interimResult,
  }) : super(key: key);

  final String firstColumnHead;
  final String firstColumnBody;
  final String secondColumnHead;
  final String secondColumnBody;
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
                firstColumnHead.toUpperCase(),
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
                secondColumnHead.toUpperCase(),
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
                  firstColumnBody,
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
                  secondColumnBody,
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
                  interimResult,
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

class FourColumnTable extends StatelessWidget {
  const FourColumnTable({
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
                  powerCalc,
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
                  restCalc,
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
                  rest,
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
                  interimResult,
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

class OneColumnTableWithSecondCalc extends StatelessWidget {
    const OneColumnTableWithSecondCalc({
      Key key,
      @required this.calculation,
      @required this.secondaryCalculaction,
    }) : super(key: key);
  
    final String calculation;
    final Widget secondaryCalculaction;

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
            ],
          ),
          TableRow(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    calculation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                    ),
                  ),
                  secondaryCalculaction,
                ],
              ),
            ],
          ),
        ],
      );
    }
  }