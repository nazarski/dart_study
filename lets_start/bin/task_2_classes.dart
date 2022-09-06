//Задачи
// 1. Создайте цепочку реальных объектов наследования, длиною 5 объектов.
// У каждого объекта должны быть поля и каждый child должен добавлять новые поля.

class Grandpa {
  String eyes;

  Grandpa(this.eyes);
}

class Dad extends Grandpa {
  String hair;

  Dad(
    String eyes,
    this.hair,
  ) : super(eyes);
}

class Me extends Dad {
  String nose;

  Me(
    String eyes,
    String hair,
    this.nose,
  ) : super(eyes, hair);
}

class Child extends Me {
  String footSize;

  Child(
    String eyes,
    String hair,
    String nose,
    this.footSize,
  ) : super(eyes, hair, nose);
}

class GrandSon extends Child {
  String mole;

  GrandSon(
    String eyes,
    String hair,
    String nose,
    String footSize,
    this.mole,
  ) : super(eyes, hair, nose, footSize);
}

// 2. Создать класс Person, который содержит:
// переменные fullName, age;
// методы move() и talk(), в которых просто вывести на консоль сообщение -"Такой-то  Person говорит".
// Добавьте конструктор Person(fullName, age).
// Создайте два объект этого класса. Объект инициализируется конструктором Person(fullName, age).
class Person {
  String fullName;
  int age;

  void move() {
    print('When $fullName was $age, he moved to Volkinschmitzelburg');
  }

  void talk() {
    print('It took a while for $fullName to start speaking German, when he '
        'turned ${age + 2}, he was fluent in it');
  }

  Person(this.fullName, this.age);

  @override
  String toString() => '$fullName $age';
}

// 3. Реализуйте класс Student (Студент), который будет наследоваться от класса Person.
// Класс должен иметь следующие свойства:
// yearOfAdmission:DateTime (год поступления в вуз): инициализируется в конструкторе
// currentCourse:int (текущий курс): рассчитывается след. образом - из текущего года вычесть год поступления.
// чтобы получить настоящее время - DateTime.now()
// чтобы получить годы из DateTime, воспользуйтесь свойством DateTime.year
// Класс должен иметь метод toString() , с помощью которого можно вывести:
// имя и фамилию студента - используя родительскую реализацию toString
// год поступления
// текущий курс
class Student extends Person {
  DateTime yearOfAdmission;

  Student(String fullNAme, int age, this.yearOfAdmission):super(fullNAme, age);
  int get currentCourse => DateTime.now().year - yearOfAdmission.year;

  @override
  String toString() => '${super.toString()} y.o applied in ${yearOfAdmission
      .year},'
      ' studies on the ${currentCourse}th course';
}

void main() {
  final mark = Person('Mark', 27);
  final robert = Person('Rapoo', 31);
  // mark.move();
  // mark.talk();

  final grandson = GrandSon('green', 'black', 'big', 'large', 'on hip');


  print(mark);
  print(robert);
  print(grandson);
  print(Student('Valencia Incognita', 19, DateTime(2018)));
}
