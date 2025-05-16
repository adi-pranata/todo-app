import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetTodo {
  final TodoRepository repository;
  GetTodo(this.repository);

  Future<List<Todo>> call(String username) {
    return Future.value(repository.getTodos(username));
  }
}
