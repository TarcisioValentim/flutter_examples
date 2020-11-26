import 'package:dio/dio.dart';
import 'package:listViewBuilder/models/ToDoModel.dart';

class ToDoRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<ToDoModel> todos = [];
    for (var json in list) {
      final todo = ToDoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
  }
}
