//Задачи
// 1. Создайте цепочку реальных объектов наследования, длиною 5 объектов.
// У каждого объекта должны быть поля и каждый child должен добавлять новые поля.

class First {
  final song = 'Tantsiuye zi smertiu';
}

class Second extends First {
  final singer = 'Lilu45';
}

class Third extends Second {
  final album = 'Viyna';
}

class Forth extends Third {
  final dateOfRelease = '06.08.2022';
}

class Fifth extends Forth {
  final youtubeUrl = 'https://www.youtube.com/watch?v=ok71pl0rdvQ';

  @override
  String toString() {
    return '$song $singer $album $dateOfRelease $youtubeUrl';
  }
}

// 2. Создать класс Person, который содержит:
// переменные fullName, age;
// методы move() и talk(), в которых просто вывести на консоль сообщение -"Такой-то  Person говорит".
// Добавьте конструктор Person(fullName, age).
// Создайте два объект этого класса. Объект инициализируется конструктором Person(fullName, age).
class Person {
  String fullName;
  int age;
  move() {
    print('When $fullName was $age, he moved to Volkinschmitzelburg');
  }
  talk() {
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
class Student extends Person{
  int yearOfAdmission;
  int get currentCourse => DateTime.now().year - yearOfAdmission;
  Student(super.fullName, super.age, this.yearOfAdmission);

@override
  String toString() => '${super.toString()} y.o applied in $yearOfAdmission,'
    ' studies on the ${currentCourse}th course';
}

void main() {
  final mark = Person('Mark', 27);
  final rapoo = Person('Rapoo', 31);
  // mark.move();
  // mark.talk();
print(Student('Valencia Incognita', 19, 2018));

}
