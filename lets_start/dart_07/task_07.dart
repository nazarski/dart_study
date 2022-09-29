import 'dart:io';

import 'package:collection/collection.dart';

// Добавьте расширение к Map<int, List<String>> printAsRepeatedWords(), которая будет выводить в консоль
// Пример:
// 3 раза повторяются слова: кот, ток, рука
// 2 раза повторяются слова: спина, наушники, ткань
//
extension PrintAsRepeatedWords on Map<int, List<String>> {
  void printAsRepeatedWords() {
    forEach((key, value) {
      print('${value.length + 1} times was repeated ${value[0]}');
    });
  }
}

// Добавьте расширение к Map<int, List<String>> printAsWordLengths(), которая будет выводить в консоль
// Пример:
// 5 букв в словах: спина, ткань
// 4 буквы в словах: мама, папа
extension PrintAsWordLengths on Map<int, List<String>> {
  void printAsWordLengths() {
    forEach((key, value) {
      print('${value[0].length} letters in ${value.join(', ')}');
    });
  }
}
extension PrintAsNumberOfLetters on Map<String, int>{
  void printAsNumberOfLetters() {
    forEach((key, value) {
      print('Letter $key was repeated $value times');
    });
  }
}


void main() {
  // 1. Регулярные выражения.
//
// Имеется текст в файле lesson_7_text.txt.
// Имеется функция для чтения
// Future<String> readTxtFile(String path) => File(path).readAsString();
// где path - путь до файла с тек;
  final File fileText =
  File('D:/dart_study/lets_start/dart_07/lesson_07_text.txt');

// Создайте функцию
// void task1(String text)
// в которой будет считаться возвращать:
  final wordsINeed = RegExp('[^а-яА-Я]+');
  final rawText = fileText.readAsStringSync();
  final linkContent = rawText.replaceAll(wordsINeed, ' ').toLowerCase();
  Map<int, List<String>> task1(String text) {
    final normalizedContent = text.split(' ').sorted();
    final length = normalizedContent.length;
    final List<List<String>> list = [];
    List<String> tempList = [];
    for (int i = 0; i < length; i++) {
      if (i + 1 < length && normalizedContent[i] == normalizedContent[i + 1]) {
        tempList.add(normalizedContent[i]);
      } else if (i > 0 &&
          i + 1 < length &&
          normalizedContent[i] != normalizedContent[i + 1] &&
          normalizedContent[i] == normalizedContent[i - 1]) {
        list.add(tempList);
        tempList = [];
      }
    }
    return list.asMap();
  }

  final Map<int, List<String>> firstMap = task1(linkContent);

// 2) Map<int, List<String>> - Список слов, отсортированный по количеству букв в слове
  Map<int, List<String>> task2(String text) {
    final normalizedContent =
    text.split(' ').sorted((a, b) => b.length - a.length).toSet().toList();
    final List<List<String>> list = [];
    List<String> tempList = [];
    int biggestWordLength = normalizedContent.first.length;
    while (biggestWordLength > 0) {
      for (int i = 0; i < normalizedContent.length; i++) {
        if (normalizedContent[i].length == biggestWordLength) {
          tempList.add(normalizedContent[i]);
        } else {
          list.add(tempList);
          tempList = [];
          biggestWordLength--;
        }
      }
    }
    return list.asMap();
  }

  final Map<int, List<String>> secondMap = task2(linkContent);


// 3) Map<String, int> - Список количества вхождений всех букв русского алфавита в этом тексте, отсортированный по убыванию
// Добавьте расширение к Map<String, int> printAsNumberOfLetters(), которая будет выводить в консоль
// Пример:
// Буква "А": 150 вхождений
// Буква "Ы": 120 вхождений
  Map<String, int> task3(String text) {
    final Map<String, int> resultMap = {};
    text.replaceAll(' ', '')
        .split('')
        .sorted()
        .forEach((x) =>
    resultMap[x] = !resultMap.containsKey(x) ? (1) : (resultMap[x]! + 1));
    return resultMap;
  }
  print(task3(linkContent));



final testingValidator = LoginDataValidation.checkIfLogInDataIsValid
  ('simsim', 'salabim22', 'salabim22');
}

extension CountUpperCaseLetters on String{
  void countUpperCaseLetters() {
    print(RegExp('[А-Я]')
        .allMatches(this)
        .length);
  }
}
extension CountLowerCaseLetters on String{
  void countLowerCaseLetters() {
    print(RegExp('[а-я]')
        .allMatches(this)
        .length);
  }
}
extension CountMarks on String{
  void countMarks() {
    print(RegExp('[,.]')
        .allMatches(this)
        .length);
  }
}
extension CountNumbers on String{
  void countNumbers() {
    print(RegExp('[0-9]')
        .allMatches(this)
        .length);
  }
}

// 3. Try-Catch
//
class LoginDataValidation {
static bool checkIfLogInDataIsValid(String login, String password, String
confirmPassword){
  final RegExp check = RegExp('^(?=[a-zA-Z0-9._]{6,20})(?!.*[_.]{2})[^_.]'
      '.*[^_.]');
  try{
    if(!check.hasMatch(login)){
      throw WrongLoginException('Wrong login!');
    }
    if(!check.hasMatch(password) || password != confirmPassword){
      throw WrongLoginException('Wrong Password!');
    }
  } on WrongLoginException catch (checked){
    print(checked.errorMessage);
    return false;
  }on WrongPasswordException catch(checked){
    print(checked.errorMessage);
    return false;
  }
  print("You've succeeded!");
  return true;
}
}
class WrongLoginException implements Exception{
  final String errorMessage;
  WrongLoginException(this.errorMessage);
  
}
class WrongPasswordException implements Exception{
  final String errorMessage;
  WrongPasswordException(this.errorMessage);
}
// Создать статический метод который принимает на вход три параметра: login, password и confirmPassword.
// Login должен содержать только латинские буквы, цифры и знак подчеркивания.
// Длина login должна быть меньше 20 символов. Если login не соответствует этим требованиям,
// необходимо выбросить WrongLoginException.
// Password должен содержать только латинские буквы, цифры и знак подчеркивания.
// Длина password должна быть меньше 20 символов. Также password и confirmPassword должны быть равны.
// Если password не соответствует этим требованиям, необходимо выбросить WrongPasswordException.
// WrongPasswordException и WrongLoginException - пользовательские классы исключения с двумя конструкторами – один по умолчанию,
// второй принимает сообщение исключения и передает его в конструктор класса Exception.
// Обработка исключений проводится внутри метода.
// Используем multi-catch block.
// Метод возвращает true, если значения верны или false в другом случае.

