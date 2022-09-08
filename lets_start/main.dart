import 'bin/task_3Hen/belarusHen.dart';
import 'bin/task_3Hen/germanHen.dart';
import 'bin/task_3Hen/henFactory.dart';
import 'bin/task_3Hen/moldovaHen.dart';
import 'bin/task_3Hen/russianHen.dart';
import 'task_3Books/books.dart';

void main() {
  final russianHen = RussianHen();
  final germanHen = GermanHen();
  final moldovaHen = MoldovanHen();
  final belarusHen = BelarusHen();
  final henFactory = HenFactory();
  print('1. ${russianHen.description} \n ${henFactory.getHen('Russia')}');

// 2.4 Создать по 2 экземпляра книг и журналов.
  final book1 = Book('Tank Butterfly');
  final book2 = Book('Little Blueberry');
  final magazine1 = Magazine('Today was yesterday');
  final magazine2 = Magazine('Cosmonullitan');
  book2.burn();
}
