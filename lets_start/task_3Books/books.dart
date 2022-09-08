
// 2.1 Создать интерфейс Printable, содержащий метод void print().
import '../task_3Mixin/burnable.dart';

abstract class Printable{
  void printable();
}
// 2.2 Создать класс Book с полем name, реализующий интерфейс Printable. (писать в консоль имя книги)
class Book with Burnable implements Printable{
  @override
  final String name;
  Book(this.name);
  @override
  void printable() {
print(name);
  }
}
// 2.3 Создать класс Magazine с полем name, реализующий интерфейс Printable. (писать в консоль имя журнала)
class Magazine with Burnable implements Printable{
  @override
  final String name;
  Magazine(this.name);
  @override
  void printable() {
    print(name);
  }
}
