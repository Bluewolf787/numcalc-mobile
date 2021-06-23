import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/conversion_calculator.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:numcalc_mobile/widgets/snackbar.dart';
import 'package:numcalc_mobile/widgets/tables.dart';

class ConversionHelper {
  List<Item> init(BuildContext context, String numberalSystem, String value) {
    List<Item> _dataResult;

    Map<String, String> _decimal;
    Map<String, String> _binary;
    Map<String, String> _octal;
    Map<String, String> _hexadecimal;

    ConversionCalculator _calculator = new ConversionCalculator();

    switch (numberalSystem.toLowerCase()) {
      case 'decimal':
        // Check for valid number
        if (int.tryParse(value) != null) {
          int intValue = int.parse(value);
          // Call conversion functions for decimal from conversion_calculator
          _binary = _calculator.convertDecimalToBinary(intValue);
          _octal = _calculator.convertDecimalToOctal(intValue);
          _hexadecimal = _calculator.convertDecimalToHexadecimal(intValue);

          // Store all results in a list as expansion panel item
          _dataResult = [
            Item(
              headerValue: 'Binary Result: ${_binary['binaryNum']}',
              expandedValue: BinaryTable(
                calculation: _binary['calculation'],
                rest: _binary['rest'],
                interimResult: _binary['interimResult'],
              ),
              subtitle: 'Base-2',
            ),
            Item(
              headerValue: 'Octal Result: ${_octal['octalNum']}',
              expandedValue: FourRowTable(
                powerCalc: _octal['powerCalc'],
                restCalc: _octal['restCalc'],
                rest: _octal['rest'],
                interimResult: _octal['interimResult'],
              ),
              subtitle: 'Base-8',
            ),
            Item(
              headerValue: 'Hexadecimal Result: ${_hexadecimal['hexNum']}',
              expandedValue: FourRowTable(
                powerCalc: _hexadecimal['powerCalc'],
                restCalc: _hexadecimal['restCalc'],
                rest: _hexadecimal['rest'],
                interimResult: _hexadecimal['interimResult'],
              ),
              subtitle: 'Base-16'
            ),
          ];
        }
        else
          CustomSnackbar.show(context, 'Please enter a valid decimal number');
        break;
      case 'binary':
        // Check for valid number 
        break;
      case 'octal':
        // Check for valid number
        break;
      case 'hexadecimal':
        // Check for valid number
        break;
    }

    return _dataResult;
  }
}