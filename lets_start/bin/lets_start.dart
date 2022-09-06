import 'package:collection/collection.dart';


void main() {
  // 1. В переменных q и w хранятся два натуральных числа. Создайте функцию,
  // выводящую на экран результат деления q на w с остатком.
  division(int q, int w) {
    return q / w;
  }
  print(division(21, 8));

  // 2. В переменной n хранится натуральное двузначное число. Создайте функцию,
  // вычисляющую и выводящую на экран сумму цифр числа n.
  sumOfNumbers(int n) {
    return '$n'
        .split('')
        .map((e) => int.parse(e))
        .sum;
  }
  print(sumOfNumbers(5555));

  // 3. В переменной n хранится вещественное число с ненулевой дробной частью. Создайте функцию,
  // округляющую число n до ближайшего целого и выводящую результат на экран.
  roundTheNumber(double num) {
    return num.round();
  }
  print(roundTheNumber(3.7852));

  // 4. В переменной n хранится натуральное трёхзначное число. Создайте функцию,
  // вычисляющую и выводящую на экран сумму цифр числа n.
  sumOfManyNumbers(int n) {
    return '$n'
        .split('')
        .map((e) => int.parse(e))
        .sum;
  }
  print(sumOfManyNumbers(5555));

}








