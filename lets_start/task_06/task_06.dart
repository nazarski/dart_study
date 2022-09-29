// 1. Для данного натурального числа n напечатайте число,
// записанное теми же десятичными цифрами, но в обратном порядке.
// Задание выполнить через цикл.
import 'dart:math';

void main() {
  void reverseInt(int num) {
    final temp = num.toString();
    String result = '';
    for (int i = temp.length - 1; i >= 0; i--) {
      result += temp[i];
    }
    print(int.parse(result));
  }

  reverseInt(1234);

// 2. а) Создайте лист из 15 случайных чисел в диапазоне от 5 до 60;
// Для генерации случайного числа использовать Random() из пакета math.
// Не следует каждый раз создавать экземляр класса Random()
  createArrayWithLoop() {
    final List<int> randArray = [];
    for (int i = 0; i <= 15; i++) {
      randArray.add(Random().nextInt(60) + 5);
    }
    return randArray;
  }

  print(createArrayWithLoop());

// b) Создайте формулы для получения максимального, минимального и среднего значения.
  final List<int> randList = createArrayWithLoop();
  String maxMinAvgValuesOfArr(List arr) {
    int max = arr[0];
    int min = arr[0];
    int sum = 0;
    for (int i = 0; i < arr.length; i++) {
      sum += arr[i] as int;
      if (arr[i] > max) {
        max = arr[i];
      } else if (min > arr[i]) {
        min = arr[i];
      }
    }
    return 'Max is $max, min is $min, and average is ${(sum / arr.length).round()}';
  }

  print(randList);
  print(maxMinAvgValuesOfArr(randList));
// c) Прочитайте про различные виды сортировок.
// https://academy.yandex.ru/posts/osnovnye-vidy-sortirovok-i-primery-ikh-realizatsii
// d) Реализуйте "сортировку пузырьком" данного листа.
  sortMeLikeYouCrazy(List<int> arr) {
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
    return arr;
  }

  print('Your sorted array: ${sortMeLikeYouCrazy(randList)}');

// 3. Напишите программу, которая выводит на консоль простые числа в промежутке от [2, 500].
// Используйте для решения этой задачи оператор "%" (остаток от деления) и циклы.

  List<int> giveMePrimeNumbers() {
    bool checkIfPrime(n) {
      for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0) {
          return false;
        }
      }
      return true;
    }

    final List<int> primeNums = [];
    for (int i = 2; i <= 500; i++) {
      if (checkIfPrime(i)) {
        primeNums.add(i);
      }
    }
    return primeNums;
  }

  print(giveMePrimeNumbers());

// 4. Даны два целых числа A и В. Используя рекурсию, выведите все числа от A
// до B включительно, в порядке возрастания, если A < B, или в порядке
// убывания в противном случае.

  void recursionRange(int a, int b) {
    print(a);
    if (a < b) {
      recursionRange(a + 1, b);
    }
    if (a > b) {
      recursionRange(a - 1, b);
    }
  }

  recursionRange(2, 5);
}

