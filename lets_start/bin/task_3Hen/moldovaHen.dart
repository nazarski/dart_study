// 1.4. Создать класс MoldovanHen, который наследуется от Hen
import 'hen.dart';

class MoldovanHen extends Hen{
  final _eggsPerMonth = 28;
  final breedOfHen = 'Moldova';
  @override
  String get description => '${super.description}. Моя страна - Молдова я несу'
      ' $_eggsPerMonth Сард өндөг';
  @override
  int getCountOfEggsPerMonth() => _eggsPerMonth;
}