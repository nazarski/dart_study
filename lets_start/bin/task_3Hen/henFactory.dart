// 1.6. В каждом из четырех последних классов написать свою реализацию метода getCountOfEggsPerMonth.
// Методы должны возвращать количество яиц в месяц от данного типа куриц.
// 1.7. В каждом из четырех последних классов написать свою реализацию метода getDescription.
// Методы должны возвращать строку вида:
// <getDescription() родительского класса>  + <" Моя страна - SSSSS. Я несу N яиц в месяц.">
// где SSSSS - название страны
// где N - количество яиц в месяц
import 'belarusHen.dart';
import 'russianHen.dart';
import 'germanHen.dart';
import 'moldovaHen.dart';

// 1.8. В классе HenFactory реализовать меетод getHen, который возвращает соответствующую стране породу кур

class HenFactory {
  String? getHen(String country) {
    switch (country) {
      case 'Russia':
        return RussianHen().breedOfHen;
      case 'German':
        return GermanHen().breedOfHen;
      case 'Moldova':
        return MoldovanHen().breedOfHen;
      case 'Belarus':
        return BelarusHen().breedOfHen;
    }
    return null;
  }
}
