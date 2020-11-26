import 'package:flutter_test/flutter_test.dart';
import 'package:listViewBuilder/repositories/ToDoRepository.dart';

main() {
  final repository = ToDoRepository();

  test('lista de ToDoModel, Ok!', () async {
    final list = await repository.fetchTodos();

    // print(list[0].title);
    expect(list[0].title, 'delectus aut autem');
  });
}
