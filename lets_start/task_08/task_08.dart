import 'dart:convert';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

// Используя репозиторий PoemRepository, получите 5 случайных поэм с описанием.
class GetPoemsThen {
  final poemsUri = Uri.parse('https://www.poemist.com/api/v1/randompoems');
  Future<Iterable<Poems>> fetchPoems() {
    return http.get(poemsUri)
        .then((value) {
        return (jsonDecode(value.body) as List<dynamic>);
      },
    )
        .then((value) {
        return value.map((e) => Poems.fromJson(e as Map<String, dynamic>));
      },
    );
  }
}

class GetPoemsAwait {
  Future<Iterable<Poems>> fetchPoems() async {
    final poemsUri = Uri.parse('https://www.poemist.com/api/v1/randompoems');
    final response = await http.get(poemsUri);
    return (jsonDecode(response.body) as List<dynamic>)
        .map((e) => Poems.fromJson(e as Map<String, dynamic>));
  }
}

class Poems {
  final String title;
  final String content;
  final String poet;

  const Poems({required this.title, required this.content, required this.poet});

  factory Poems.fromJson(Map<String, dynamic> json) {
    return Poems(
      title: json['title'] as String,
      content: json['content'] as String,
      poet: json['poet']['name'] as String,
    );
  }

  @override
  String toString() {
    return 'Poems {title:$title, content: $content, poet: $poet} ';
  }
}

void main() {
  Future<void> translateRandomPoemsWithAsync() async {
    final getPoems = GetPoemsAwait();
    final fetchPoems = await getPoems.fetchPoems();
    final translator = GoogleTranslator();
    for (var element in fetchPoems) {
      translator.translateAndPrint('$element', to: 'uk');
    }
  }

  translateRandomPoemsWithAsync();

  Future<void> translateRandomPoemsWithThen() {
    final translator = GoogleTranslator();
    return GetPoemsThen()
        .fetchPoems()
        .then((value) {
        for (var element in value) {
          translator.translateAndPrint('$element', to: 'uk');
        }
      },
    );
  }

  translateRandomPoemsWithThen();
  // В зависимостях появилась библиотека translator: ^0.1.7
  // Необходимо зайти в pubspec.yaml и нажать на pub get или в корне проекта, в терминале вызвать dart pub get
  // Теперь вы можете создать объект

  // Переведите их описания и названия.
  //
  // сделайте это двумя способавми. Через  then и async - await
}
