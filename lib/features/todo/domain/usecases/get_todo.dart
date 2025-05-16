import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetTodo {
  final TodoRepository repository;
  GetTodo(this.repository);

  List<Todo> call(String username) {
    return repository.getTodos(username);
  }
}
