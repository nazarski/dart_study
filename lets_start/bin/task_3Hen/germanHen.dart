// 1.3. Создать класс GermanHen, который наследуется от Hen
import 'hen.dart';

class GermanHen extends Hen{
  final _eggsPerMonth = 30;
  final breedOfHen = 'Germany';
  @override
  String get description=> '${super.description}. Mein Land ist Deutschland, das ich'
      ' trage $_eggsPerMonth Eier pro Monat';
  @override
  int getCountOfEggsPerMonth() => _eggsPerMonth;
}