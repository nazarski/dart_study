import 'dart:async';

import 'package:test/test.dart';

void main() {
  // 1. Создайте функцию, получающие на вход int и возвращающие String 'верно' или 'неверно'
// Если переменная a больше нуля и меньше 5-ти
  String tellIfMoreThanFive(int num) =>
      num > 0 && num < 5 ? "Верно" : "Неверно";

  print(tellIfMoreThanFive(2));

// 2. Создайте функцию, получающие на вход int и возвращающие double
// Если переменная a равна нулю или равна двум, то прибавьте к ней 7, иначе поделите ее на 10.
// Проделайте это дважды при помощи тернатрного оператора и конструкции if-else
  double makeSomeChanges(int num) => num == 0 || num == 2 ? num + 7 : num / 10;

  print(makeSomeChanges(3));

  double makeSomeChangesWithIfs(int num) {
    if (num == 0 || num == 2) {
      return num + 7;
    } else {
      return num / 10;
    }
  }

// 3. Часть часа
// В переменной min лежит число от 0 до 59.
// Определите в какую четверть часа попадает это число (в первую, вторую, третью или четвертую).
  String quarterOfHour(int min) {
    if (min < 0 || min > 59) {
      return 'Error';
    } else {
      if (min <= 15) {
        return 'First quarter';
      } else if (min <= 30) {
        return 'Second quarter';
      } else if (min <= 45) {
        return 'Third quarter';
      } else {
        return 'Forth quarter';
      }
    }
  }

  print(quarterOfHour(21));

//
// 4. Дни недели;
// аргументы функции
// int - номера дня недели
// int - время, часов
// enum Lang - язык (ru, eng)
  String daysOfWeekEng(int numOfDay) {
    switch (numOfDay) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
      case 7:
        return 'Weekend';
    }
    return 'Smth went wrong';
  }

  String timeOfHourEng(int hour) {
    if (hour <= 8) {
      return 'Night';
    } else if (hour <= 12) {
      return 'Morning';
    } else if (hour <= 20) {
      return 'Day';
    } else if (hour <= 23) {
      return 'Evening';
    } else if (hour <= 12) {
      return 'Morning';
    }
    return 'Smth went wrong';
  }

  String daysOfWeekRus(int numOfDay) {
    switch (numOfDay) {
      case 1:
        return 'Понедельник';
      case 2:
        return 'Вторник';
      case 3:
        return 'Среда';
      case 4:
        return 'Четверг';
      case 5:
        return 'Пятница';
      case 6:
      case 7:
        return 'Выходной';
    }
    return 'Что-то не справляюсь';
  }

  String timeOfHourRus(int hour) {
    if (hour <= 8) {
      return 'Ночь';
    } else if (hour <= 12) {
      return 'Утро';
    } else if (hour <= 20) {
      return 'День';
    } else if (hour <= 23) {
      return 'Вечер';
    }
    return 'Что-то не справляюсь';
  }

  String daysOfWeek(int numOfDay, int hours, Lang lang) {
    final String day;
    final String time;
    if ((hours < 0 || hours > 23) || (numOfDay < 0 || numOfDay > 7)) {
      return 'Error';
    } else {
    if (lang == Lang.eng) {
      day = daysOfWeekEng(numOfDay);
      time = timeOfHourEng(hours);
      return 'Today is $day and it`s $time';
    } else {
      day = daysOfWeekRus(numOfDay);
      time = timeOfHourRus(hours);
      return 'Сегодня $day и сейчас $time';
    }
  }
  }

  print(daysOfWeek(4,12, Lang.ru));

// Если число равно 1, выводим то это 'Понедельник', 2 –”Вторник” и так далее. Если 6 или 7 – “Выходной”.
// Так же по времени - от 0 до 8 - ночь, от 8 до 12 - утро, от 12 до 20 день, от 20 до 23 - вечер.
// если Lang.ru - выводить на русском, если Lang.eng - на английском
//
// а) Обработать невалидные аргументы
// б) функция должна возвращать например, 'Понедельник, день' или то же самое на английском языке
// в) сделать у функции необязательный четвертый аргумент - коллбек, возвращающий результат.
// г) дважды вызвать функцию и вывести в консоль значения из коллбека и из ретерна
// д) создание вспомогательных функций приветствуется
}

enum Lang { ru, eng }
