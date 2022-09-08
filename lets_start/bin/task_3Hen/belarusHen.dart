// 1.5. Создать класс BelarusianHen, который наследуется от Hen
import 'hen.dart';

class BelarusHen extends Hen{
  final _eggsPerMonth = 45;
  final breedOfHen = 'Belarus';
  @override
  String get description => '${super.description}. Моя страна - Беларусь я несу'
      ' $_eggsPerMonth яек у месяц';
  @override
  int getCountOfEggsPerMonth() => 45;
}