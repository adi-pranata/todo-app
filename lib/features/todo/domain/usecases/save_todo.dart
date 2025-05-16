import 'package:todo_app/features/todo/data/models/todo_model.dart';

import '../repositories/todo_repository.dart';

class SaveTodo {
  final TodoRepository repository;
  SaveTodo(this.repository);

  Future<void> call(String username, List<TodoModel> todos) {
    return repository.saveTodos(username, todos);
  }
}
