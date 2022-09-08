

// 1.2. Создать класс RussianHen, который наследуется от Hen
import 'hen.dart';

class RussianHen extends Hen{
  final _eggsPerMonth = 1;
  final breedOfHen = 'Russian';
  @override
  String get description => '${super.description}. Моя страна - Россия я несу '
      '$_eggsPerMonth яйцо в месяц';
  @override
  int getCountOfEggsPerMonth() => _eggsPerMonth;
}