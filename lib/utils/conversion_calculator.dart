import 'dart:math';

import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:numcalc_mobile/widgets/tables.dart';

class ConversionCalculator {

  Map<String, String> convertDecimalToBinary(int value) {
    Map<String, String> output = {'binaryNum': '0b', 'calculation': '', 'rest': '', 'interimResult': ''};

    if (value == 0) {
      output['binaryNum'] += '0';
      return output;
    }

    // Search the largest exponent
    int exponent = 0;
    while (pow(2, exponent) <= value) {
      exponent += 1;

      if (pow(2, exponent + 1) > value)
        break;
    }

    // Subtract the power of 2 with the largest exponent from value and write down a 1
    int valueRest = value - pow(2, exponent);
    output['binaryNum'] += '1';
    output['calculation'] += '2^$exponent = ${pow(2, exponent)} < $value\n';
    output['rest'] += '$value - ${pow(2, exponent)} = $valueRest\n';
    output['interimResult'] += '${output['binaryNum']}\n';

    // If the next lower exponent is less then valueRest Then write a 1 else a 0.
    // Repeat until rest is 0
    for (int i = 1; i <= exponent; i++) {
      int newExponent = exponent - (i);
      int power = pow(2, newExponent);

      if (power > valueRest) {
        output['binaryNum'] += '0';
        output['calculation'] += '2^$newExponent = $power > $valueRest\n';
        output['rest'] += '\n';
        output['interimResult'] += '${output['binaryNum']}\n';
      }
      else {
        output['binaryNum'] += '1';
        output['calculation'] += '2^$newExponent = $power < $valueRest\n';
        output['rest'] += '$valueRest - $power = ${valueRest - power}\n';
        output['interimResult'] += '${output['binaryNum']}\n';

        valueRest = valueRest - power;
      }
    }

    return output;
  }

  Map<String, String> convertDecimalToOctal(int value) {
    Map<String, String> output = {'octalNum': '0o','powerCalc': '', 'restCalc': '', 'rest': '', 'interimResult': ''};

    int exponent = 1;
    while (pow(8, exponent) < value)
      exponent += 1;

    exponent -= 1;

    int integer = 0;
    for (int i = exponent; i >= 0; i--) {
      int restCalcDividend = value;
      int power = pow(8, i);

      integer = (value / power).floor();
      value %= power;

      output['octalNum'] += '$integer';
      output['powerCalc'] += '8^$i = $power\n';
      output['restCalc'] += '$restCalcDividend / $power = $integer\n';
      output['rest'] += '$value\n';
      output['interimResult'] += '${output['octalNum']}\n';
    }

    return output;
  }

  Map<String, String> convertDecimalToHexadecimal(int value) {
    Map<String, String> output = {'hexNum': '0x','powerCalc': '', 'restCalc': '', 'rest': '', 'interimResult': ''};

    int exponent = 1;
    while (pow(16, exponent) < value)
      exponent += 1;

    exponent -= 1;

    int integer = 0;
    for (int i = exponent; i >= 0; i--) {
      int restCalcDivider = value;
      int power = pow(16, i);

      integer = (value / power).floor();
      value %= power;

      switch (integer) {
        case 10: 
          output['hexNum'] += 'A';
          break;
        case 11: 
          output['hexNum'] += 'B';
          break;
        case 12: 
          output['hexNum'] += 'C';
          break;
        case 13: 
          output['hexNum'] += 'D';
          break;
        case 14: 
          output['hexNum'] += 'E';
          break;
        case 15: 
          output['hexNum'] += 'F';
          break;
        default: 
          output['hexNum'] += integer.toString();
          break;
      }

      output['powerCalc'] += '16^$i = $power\n';
      output['restCalc'] += '$restCalcDivider / $power = $integer\n';
      output['rest'] += '$value\n';
      output['interimResult'] += '${output['hexNum']}\n';
    }

    return output;
  }
  
  Map<String, String> convertBinaryToOctal(String value) {
    Map<String, String> output = {'octNum': '0o', 'binBlock': '', 'octBlock': '', 'interimResult': ''};

    Map<String, String> octalTable = {'000': '0', '001': '1', '010': '2', '011': '3', '100': '4', '101': '5', '110': '6', '111': '7'};

    // Split the binary number into blocks with 3 digits
    List<String> binSplit = [];
    value = value.trim().replaceAll(RegExp(r'^0+(?!$)'), '');
    while (value != '') {
      if (value.length > 2) {
        binSplit.add(value.substring(value.length - 3, value.length));
        value = value.substring(0, value.length - 3);
      }
      else {
        binSplit.add(value);
        break;
      }
    }

    List<String> binSplitReversed = new List.from(binSplit.reversed);
    for (int i = 0; i < binSplitReversed.length; i++) {
      // Fill up the blocks without 3 digits with 0's
      var currentBlock = binSplitReversed[i].padLeft(3, '0');

      // Search the Octal number for the binary blocks
      output['octNum'] += octalTable[currentBlock];

      output['binBlock'] += '$currentBlock\n';
      output['octBlock'] += '${octalTable[currentBlock]}\n';
      output['interimResult'] += '${output['octNum']}\n';
    }

    return output;
  }

  Map<String, String> convertBinaryToDecimal(String value) {
    Map<String, String> output = {'decNum': '', 'calc': ''};
    int decNum = 0;

    value = value.trim().replaceAll(RegExp(r'^0+(?!$)'), '').split('').reversed.join('');
    int exponent = 0;
    for (int i = 0; i < value.length; i++) {
      if (value[i] == '1') {
        decNum += pow(2, exponent);

        if (exponent + 1 == value.length)
          output['calc'] += '2^$exponent = $decNum';
        else
          output['calc'] += '2^$exponent + ';

        exponent += 1;
      }
      else
        exponent += 1;
    }

    output['decNum'] = decNum.toString();
    return output;
  }

  Map<String, String> convertBinaryToHexadecimal(String value) {
    Map<String, String> output = {'hexNum': '0x', 'binBlock': '', 'hexBlock': '', 'interimResult': ''};
  
    Map<String, String> hexTable = {'0000': '0', '0001': '1', '0010': '2', '0011': '3', '0100': '4', '0101': '5', '0110'    : '6', '0111': '7', '1000': '8', '1001': '9', '1010': 'A', '1011': 'B', '1100': 'C', '1101': 'D', '11    10': 'E', '1111': 'F'};

    // Split the binary number into blocks with 4 digits
    List<String> binSplit = [];
    value = value.trim().replaceAll(RegExp(r'^0+(?!$)'), '');
    while (value != '') {
      if (value.length > 3) {
        binSplit.add(value.substring(value.length - 4, value.length));
        value = value.substring(0, value.length - 4);
      }
      else {
        binSplit.add(value);
        break;
      }
    }

    List<String> binSplitReversed = new List.from(binSplit.reversed);
    for (int i = 0; i < binSplitReversed.length; i++) {
      // Fill up the blocks without 4 digits with 0's
      var currentBlock = binSplitReversed[i].padLeft(4, '0');

      // Search the Hexadecimal number for the binary blocks 
      output['hexNum'] += hexTable[currentBlock];

      output['binBlock'] += '$currentBlock\n';
      output['hexBlock'] += '${hexTable[currentBlock]}\n';
      output['interimResult'] += '${output['hexNum']}\n';
    }

    return output;
  }

  Map<String, String> convertOctalToDecimal(String value) {
    Map<String, String> output = {'decNum': '', 'calc': ''};
    int decNum = 0;

    value = value.split('').reversed.join('');
    int exponent = 0;
    for (int i = 0; i < value.length; i++) {
      int digit = int.parse(value[i]);
      decNum += (pow(8, exponent) * digit);

      if (exponent + 1 == value.length)
        output['calc'] += '8^$exponent * $digit = $decNum';
      else
        output['calc'] += '8^$exponent * $digit + ';

      exponent += 1;
    }

    output['decNum'] = decNum.toString();

    return output;
  }

  Map<String, String> convertOctalToBinary(String value) {
    Map<String, String> output = {'binNum': '0b', 'octBlock': '', 'binBlock': '', 'interimResult': ''};

    Map<int, String> binTable = {0: '000', 1: '001', 2: '010', 3: '011', 4: '100', 5: '101', 6: '110', 7: '111'};

    for (int i = 0; i < value.length; i++) {
      int digit = int.parse(value[i]);
      output['binNum'] += binTable[digit];
      output['octBlock'] += '${digit.toString()}\n';
      output['binBlock'] += '${binTable[digit]}\n';
      output['interimResult'] += '${output['binNum']}\n';
    }

    output['binNum'] = output['binNum'].trimLeft().replaceAll(RegExp(r'^0+(?!$)'), '');

    return output;
  }

  Map<String, dynamic> convertOctalToHexadecimal(String value) {
    Map<String, dynamic> output = {'hexNum': '0x', 'decCalc': '', 'hexCalc': ''};

    Map<String, String> octalToDecimal = convertOctalToDecimal(value);
    Map<String, String> decimalToHexadecimal = convertDecimalToHexadecimal(int.parse(octalToDecimal['decNum']));

    output['hexNum'] = decimalToHexadecimal['hexNum'];
    output['decCalc'] = octalToDecimal['calc'];
    output['hexCalc'] = FourColumnTable(
      powerCalc: decimalToHexadecimal['powerCalc'],
      restCalc: decimalToHexadecimal['restCalc'],
      rest: decimalToHexadecimal['rest'],
      interimResult: decimalToHexadecimal['interimResult'],
    );

    return output;
  }

} 