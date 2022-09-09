import 'dart:math';
import 'dart:core';
import 'package:collection/collection.dart';

// 1. Операции с List
// В этом задании можно (и даже нужно) иногда создавать новые экземпляры листов и продолжать уже с ними
// В этом задании НЕЛЬЗЯ использовать циклы. Толкьо методы List и Iterable
//
// a) Создайте List<int> из 20 случайных чисел в диапазоне от 0 до 100. Выведите в консоль.
// Для генерации случайного числа использовать Random().nextInt(100) из пакета math.
// Не следует каждый раз создавать экземляр класса Random()
void main() {
  final arrayOfRandoms =
      List<int>
          .generate(20, (index) => index = Random()
          .nextInt(100));

  // b) Выведите в консоль длину листа.
  print(arrayOfRandoms.length);
  // с) Уберите из листа все числа, кратные 5 и 7. Выведите в консоль.
  print(arrayOfRandoms
      .where((element) => (element % 5 == 0 && element % 7 == 0))
      .toList());
// d) Отсортируйте лист по возрастанию. Выведите в консоль.
  arrayOfRandoms.sort();
  print(arrayOfRandoms);
// e) Отсортируйте лист таким образом, что сначала идут четные, затем нечетные,
// при этом не нарушая сортировку по возрастанию, внутри четной и нечетных частей. Выведите в консоль.
// Для этого создайте собственную функцию-компаратор.

  final List<int> sortedComparatorArr = arrayOfRandoms.sorted((a, b) {
    if (a.isOdd && b.isEven) {
      return 1;
    }
    return 0;
  });

  print('Sorted Arr $sortedComparatorArr');
// f) Удалите первый и последний элемент списка. Выведите в консоль.
  arrayOfRandoms.removeAt(0);
  arrayOfRandoms.removeAt(arrayOfRandoms.length - 1);
  print(arrayOfRandoms);

// g) Измените все элементы листа, добавив к ним 1. Выведите в консоль.
  print(arrayOfRandoms
      .map((e) => e + 1)
      .toList());

// h) Добавьте в лист еще елементы, каждый из которых будет на 100 больше элемента из списка. Выведите в консоль.
  arrayOfRandoms
      .addAll(arrayOfRandoms
      .map((e) => e + 100)
      .toList());
  print(arrayOfRandoms);

// Используйте функцию expand
  final Iterable<int> expandedArr = arrayOfRandoms
      .expand((element) => [element + element,element + element])
      .toList();
  print(expandedArr);


// i) Перемешайте элементы листа в случайном порядке. Выведите в консоль.
  arrayOfRandoms.shuffle();
print(arrayOfRandoms);
// j) Найдите первое число больше 100 в листе. Выведите в консоль.
  print(arrayOfRandoms.firstWhere((element) => element>100));
// k) Найдите индекс этого числа. Выведите в консоль.
  print(arrayOfRandoms
      .indexOf(arrayOfRandoms
      .firstWhere((element) => element>100)));
// l) Проверить, находится ли в списке хотя бы одно число из 100, 37, 55, 99, 64.
// Результат проверки вывестив  консоль.
  print(arrayOfRandoms
      .any((element) => element == 100 ||
      element == 37 ||
      element == 55 ||
      element == 99 ||
      element == 64));
// m) Посчитать сумму всех чисел в листе. Выведите в консоль.
  print(arrayOfRandoms.reduce((value, element) => value+=element));
// n) Превратить все элементы листа в String таким образом, чтобы каждый лемемент был 'Number <element>'.
// Выведите в консоль.
  final stringedArr = arrayOfRandoms.map((e) => 'Number $e').toList();
  print(stringedArr);
// o) Используя лист из задания n, превратите оего обратно в List<int> при помощи функции int.parse()
// и функциями класса String.
  print(stringedArr.map((e) => int.parse(e.replaceAll('Number ', ''))));
// При помощи функции expand каждый элемент запишите трижды в лист.
// Выведите в консоль.
  final Iterable<int> expandedTripleArr = arrayOfRandoms
      .expand((element) => [element, element,element])
      .toList();
  print(expandedTripleArr);

// 2. Операции с Set (так как создается по дефолту LinkedHashSet, они, в большинстве своем, повторяют операции из List)
//
// Создайте Set из последнего результирующего листа прошлого задания.
  final setTheSet = expandedTripleArr.toSet();
  print(setTheSet);
// 3. Операции с Map
// a) Создайте Лист из последнего сета. Создайте Map<int, int> из листа, используя функцию asMap() листа.
final Map<int, int> myMap = setTheSet.toList().asMap();
// Выведите в консоль.
  print(myMap);
// Обратите внимание на специфику метода asMap().

// b) Создать объект GoldenRationSize(int smallSide), c полями int smallSide,
// int bigSide и переопределением поля toString().
// Большая сторона высчитывается через коэффициент золотого сечения и округляется.
// c) Заменить values в мапе на объекты GoldenRationSize, передавая значение в конструктор.
// должна получиться Map<int, GoldenRationSize>. Выведите в консоль.

final Map<int, GoldenRationSize> newMap = myMap
    .map((key, value) =>
    MapEntry(key, GoldenRationSize(value)));

  print(newMap);
}
class GoldenRationSize{
  final int smallSide;
  final int bigSide;
  GoldenRationSize(this.smallSide) : bigSide = (smallSide*1.618).round();
  @override
  String toString() {
    return '$smallSide $bigSide';
  }
}


