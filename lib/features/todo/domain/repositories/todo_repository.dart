import 'package:todo_app/features/todo/data/models/todo_model.dart';

import '../entities/todo.dart';

abstract class TodoRepository {
  List<Todo> getTodos(String username);
  Future<void> saveTodos(String username, List<TodoModel> todos);
}
