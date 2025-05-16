import 'package:todo_app/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class SaveTodo {
  final TodoRepository repository;
  SaveTodo(this.repository);

  Future<void> call(String username, List<Todo> todos) {
    return repository.saveTodos(username, todos);
  }
}
