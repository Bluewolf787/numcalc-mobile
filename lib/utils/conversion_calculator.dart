import 'dart:math';
import 'package:numcalc_mobile/widgets/tables.dart';

class ConversionCalculator {
  Map<String, String> convertDecimalToBinary(int value) {
    Map<String, String> output = {
      'binNum': '0b',
      'calculation': '',
      'rest': '',
    };

    String binNum = '';

    int rest = 0;
    int saveValue = 0;
    while (value != 0) {
      saveValue = value;

      rest = value % 2;
      binNum += rest.toString();
      value = (value / 2).floor();

      output['calculation'] += '$saveValue / 2 = $value\n';
      output['rest'] += '$rest\n';
    }

    output['binNum'] = binNum.split('').reversed.join();

    return output;
  }

  Map<String, String> convertDecimalToOctal(int value) {
    Map<String, String> output = {
      'octalNum': '0o',
      'powerCalc': '',
      'restCalc': '',
      'rest': '',
      'interimResult': ''
    };

    int exponent = 1;
    while (pow(8, exponent) < value) exponent += 1;

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
    Map<String, String> output = {
      'hexNum': '0x',
      'powerCalc': '',
      'restCalc': '',
      'rest': '',
      'interimResult': ''
    };

    int exponent = 1;
    while (pow(16, exponent) < value) exponent += 1;

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
    Map<String, String> output = {
      'octNum': '0o',
      'binBlock': '',
      'octBlock': '',
      'interimResult': ''
    };

    Map<String, String> octalTable = {
      '000': '0',
      '001': '1',
      '010': '2',
      '011': '3',
      '100': '4',
      '101': '5',
      '110': '6',
      '111': '7'
    };

    // Split the binary number into blocks with 3 digits
    List<String> binSplit = [];
    value = value.trim().replaceAll(RegExp(r'^0+(?!$)'), '');
    while (value != '') {
      if (value.length > 2) {
        binSplit.add(value.substring(value.length - 3, value.length));
        value = value.substring(0, value.length - 3);
      } else {
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

    value = value
        .trim()
        .replaceAll(RegExp(r'^0+(?!$)'), '')
        .split('')
        .reversed
        .join('');
    int exponent = 0;
    for (int i = 0; i < value.length; i++) {
      if (value[i] == '1') {
        decNum += pow(2, exponent);

        if (exponent + 1 == value.length)
          output['calc'] += '2^$exponent = $decNum';
        else
          output['calc'] += '2^$exponent + ';

        exponent += 1;
      } else
        exponent += 1;
    }

    output['decNum'] = decNum.toString();
    return output;
  }

  Map<String, String> convertBinaryToHexadecimal(String value) {
    Map<String, String> output = {
      'hexNum': '0x',
      'binBlock': '',
      'hexBlock': '',
      'interimResult': ''
    };

    Map<String, String> hexTable = {
      '0000': '0',
      '0001': '1',
      '0010': '2',
      '0011': '3',
      '0100': '4',
      '0101': '5',
      '0110': '6',
      '0111': '7',
      '1000': '8',
      '1001': '9',
      '1010': 'A',
      '1011': 'B',
      '1100': 'C',
      '1101': 'D',
      '1110': 'E',
      '1111': 'F'
    };

    // Split the binary number into blocks with 4 digits
    List<String> binSplit = [];
    value = value.trim().replaceAll(RegExp(r'^0+(?!$)'), '');
    while (value != '') {
      if (value.length > 3) {
        binSplit.add(value.substring(value.length - 4, value.length));
        value = value.substring(0, value.length - 4);
      } else {
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
    Map<String, String> output = {
      'binNum': '0b',
      'octBlock': '',
      'binBlock': '',
      'interimResult': ''
    };

    Map<int, String> binTable = {
      0: '000',
      1: '001',
      2: '010',
      3: '011',
      4: '100',
      5: '101',
      6: '110',
      7: '111'
    };

    for (int i = 0; i < value.length; i++) {
      int digit = int.parse(value[i]);
      output['binNum'] += binTable[digit];
      output['octBlock'] += '${digit.toString()}\n';
      output['binBlock'] += '${binTable[digit]}\n';
      output['interimResult'] += '${output['binNum']}\n';
    }

    output['binNum'] =
        output['binNum'].trimLeft().replaceAll(RegExp(r'^0+(?!$)'), '');

    return output;
  }

  Map<String, dynamic> convertOctalToHexadecimal(String value) {
    Map<String, dynamic> output = {
      'hexNum': '0x',
      'decCalc': '',
      'hexCalc': ''
    };

    Map<String, String> octalToDecimal = convertOctalToDecimal(value);
    Map<String, String> decimalToHexadecimal =
        convertDecimalToHexadecimal(int.parse(octalToDecimal['decNum']));

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

  Map<String, String> convertHexadecimalToDecimal(String value) {
    Map<String, String> output = {'decNum': '', 'calculation': ''};
    int decNum = 0;

    List<int> digits = [];
    for (int i = 0; i < value.length; i++) {
      switch (value[i]) {
        case 'A':
          digits.add(10);
          break;

        case 'B':
          digits.add(11);
          break;

        case 'C':
          digits.add(12);
          break;

        case 'D':
          digits.add(13);
          break;

        case 'E':
          digits.add(14);
          break;

        case 'F':
          digits.add(15);
          break;

        default:
          digits.add(int.parse(value[i]));
          break;
      }
    }

    List<int> interimResults = [];

    int exponent = 0;
    int interimResult = 0;
    for (int i = 0; i < digits.length; i++) {
      interimResult = digits[i] * pow(16, exponent);
      decNum += interimResult;
      interimResults.add(interimResult);

      output['calculation'] += '${digits[i]} * 16^$exponent = $interimResult\n';
      exponent += 1;
    }

    output['calculation'] += '\n';

    for (int i = 0; i < interimResults.length; i++) {
      if (i == interimResults.length - 1)
        output['calculation'] += '${interimResults[i]} = ${decNum.toString()}';
      else
        output['calculation'] += '${interimResults[i]} + ';
    }

    output['decNum'] = decNum.toString();

    return output;
  }

  Map<String, String> convertHexadecimalToBinary(String value) {
    Map<String, String> output = {
      'binNum': '0b',
      'hexBlock': '',
      'binBlock': '',
      'interimResult': ''
    };
    String binNum = '';
    String hexBlock = '';
    String binBlock = '';
    String interimResult = '';

    for (int i = 0; i < value.length; i++) {
      switch (value[i].toUpperCase()) {
        case '0':
          binNum += '0000';
          interimResult += '$binNum\n';
          hexBlock += '0\n';
          binBlock += '0000\n';
          break;

        case '1':
          binNum += '0001';
          interimResult += '$binNum\n';
          hexBlock += '1\n';
          binBlock += '0001\n';
          break;

        case '2':
          binNum += '0010';
          interimResult += '$binNum\n';
          hexBlock += '2\n';
          binBlock += '0010\n';
          break;

        case '3':
          binNum += '0011';
          interimResult += '$binNum\n';
          hexBlock += '3\n';
          binBlock += '0011\n';
          break;

        case '4':
          binNum += '0100';
          interimResult += '$binNum\n';
          hexBlock += '4\n';
          binBlock += '0100\n';
          break;

        case '5':
          binNum += '0101';
          interimResult += '$binNum\n';
          hexBlock += '5\n';
          binBlock += '0101\n';
          break;

        case '6':
          binNum += '0110';
          interimResult += '$binNum\n';
          hexBlock += '6\n';
          binBlock += '0110';
          break;

        case '7':
          binNum += '0111';
          interimResult += '$binNum\n';
          hexBlock += '7\n';
          binBlock += '0111\n';
          break;

        case '8':
          binNum += '1000';
          interimResult += '$binNum\n';
          hexBlock += '8\n';
          binBlock += '1000\n';
          break;

        case '9':
          binNum += '1001';
          interimResult += '$binNum\n';
          hexBlock += '9\n';
          binBlock += '1001\n';
          break;

        case 'A':
          binNum += '1010';
          interimResult += '$binNum\n';
          hexBlock += 'A\n';
          binBlock += '1010\n';
          break;

        case 'B':
          binNum += '1011';
          interimResult += '$binNum\n';
          hexBlock += 'B\n';
          binBlock += '1011\n';
          break;

        case 'C':
          binNum += '1100';
          interimResult += '$binNum\n';
          hexBlock += 'C\n';
          binBlock += '1100\n';
          break;

        case 'D':
          binNum += '1101';
          interimResult += '$binNum\n';
          hexBlock += 'D\n';
          binBlock += '1101\n';
          break;

        case 'E':
          binNum += '1110';
          interimResult += '$binNum\n';
          hexBlock += 'E\n';
          binBlock += '1110\n';
          break;

        case 'F':
          binNum += '1111';
          interimResult += '$binNum\n';
          hexBlock += 'F\n';
          binBlock += '1111\n';
          break;
      }
    }

    output['binNum'] += binNum.trimLeft().replaceAll(RegExp(r'^0+(?!$)'), '');
    output['hexBlock'] = hexBlock;
    output['binBlock'] = binBlock;
    output['interimResult'] = interimResult;

    return output;
  }

  Map<String, dynamic> convertHexadecimalToOctal(String value) {
    Map<String, dynamic> output = {'octNum': '', 'binCalc': '', 'octCalc': ''};

    Map<String, String> hexadecimalToBinary = convertHexadecimalToBinary(value);
    Map<String, String> binaryToOctal =
        convertBinaryToOctal(hexadecimalToBinary['binNum'].substring(2));

    output['octNum'] = binaryToOctal['octNum'];
    output['binCalc'] = ThreeColumnTable(
      firstColumnHead: 'hexadecimal',
      firstColumnBody: hexadecimalToBinary['hexBlock'],
      secondColumnHead: 'binary',
      secondColumnBody: hexadecimalToBinary['binBlock'],
      interimResult: hexadecimalToBinary['interimResult'],
    );
    output['octCalc'] = ThreeColumnTable(
      firstColumnHead: 'binary',
      firstColumnBody: binaryToOctal['binBlock'],
      secondColumnHead: 'octal',
      secondColumnBody: binaryToOctal['octBlock'],
      interimResult: binaryToOctal['interimResult'],
    );

    return output;
  }
}
