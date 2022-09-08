// 3.1 Создать миксин Burnable с методом void burn() и реализацией (писать в консоль что предмет горит)
mixin Burnable{
  final String name = '';
  void burn()=> print('$name Самовоспламенился');
}
// 3.2 Добавить этот миксин к классам Book и Magazine из второго задания