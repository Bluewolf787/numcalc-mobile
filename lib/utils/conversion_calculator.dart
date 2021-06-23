import 'dart:math';

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

}