import 'dart:async';
import 'dart:io';
import 'package:decimal/decimal.dart';
import 'dart:convert';

//
//
// Используя структуру
// stdin.transform(utf8.decoder).transform(const LineSplitter()).listen(<ваша функция>);

void main() {
  StreamSubscription<String>? prompt;
  prompt = stdin
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((value) {
    if (value == 'exit') {
      prompt?.cancel();
    } else {
      Calculator.checkCalculatorForExitValues(value);
    }
  });
}

Decimal memorized = Decimal.fromInt(0);

class Calculator {
  static checkCalculatorForExitValues(String str) {
    final normalizedStr = str.toLowerCase().trim().replaceAll(',', '.');
    if (RegExp('[a-zA-Zа-яА-Я]').hasMatch(normalizedStr)) {
      print('How am I supposed to count letters?');
    } else if (RegExp(r"\s").hasMatch(normalizedStr)) {
      print('No spaces! jeez..');
    } else if (RegExp('[+/*%-]').allMatches(normalizedStr).length > 1) {
      print('It`s one operation at time. Can`t do it better for now');
    } else if (RegExp('[.]{2}').hasMatch(normalizedStr)) {
      print('Too many dots');
    } else if (!RegExp('[+/*%-]').hasMatch(normalizedStr)) {
      print('What am I supposed to do with it?');
    } else if (!RegExp('[0-9.+/*%-]').hasMatch(normalizedStr)) {
      print('I don`t know how to put it.. but something is definitely wrong');
    } else {
      stringToOperationsAndNumbers(normalizedStr);
    }
  }

  static stringToOperationsAndNumbers(String str) {
    final mathOperator = RegExp('[+/*%-]').stringMatch(str).toString();
    final listOfNumbers = str.split(mathOperator);
    if (!listOfNumbers.contains('')) {
      memorized = Decimal.fromInt(0);
      final Decimal firstNumber = Decimal.parse(listOfNumbers[0]);
      final Decimal secondNumber = Decimal.parse(listOfNumbers[1]);
      selectingOperation(mathOperator, firstNumber, secondNumber);
    } else {
      listOfNumbers.remove('');
      final Decimal firstNumber = memorized;
      final Decimal secondNumber = Decimal.parse(listOfNumbers[0]);
      selectingOperation(mathOperator, firstNumber, secondNumber);
    }
  }

  static addition(Decimal num1, Decimal num2) {
    memorized = num1 + num2;
    print(memorized);
  }

  static subtraction(Decimal num1, Decimal num2) {
    memorized = num1 - num2;
    print(memorized);
  }

  static division(Decimal num1, Decimal num2) {
    if (num2 != Decimal.fromInt(0)) {
      memorized = Decimal.parse((num1.toDouble() / num2.toDouble()).toString());
      print(memorized);
    } else {
      print("It's infinity. Everything's possible");
    }
  }

  static multiplication(Decimal num1, Decimal num2) {
    memorized = num1 * num2;
    print(memorized);
  }

  static getPercentFromNumber(Decimal num1, Decimal num2) {
    if (num2 != Decimal.fromInt(0)) {
      memorized =
          Decimal.parse((num1.toDouble() / 100.0 * num2.toDouble()).toString());
      print(memorized);
    } else {
      print("Total Zero");
    }
  }

  static selectingOperation(String operator, Decimal num1, Decimal num2) {
    switch (operator) {
      case '+':
        return addition(num1, num2);
      case '-':
        return subtraction(num1, num2);
      case '*':
        return multiplication(num1, num2);
      case '/':
        return division(num1, num2);
      case '%':
        return getPercentFromNumber(num1, num2);
    }
  }
}
