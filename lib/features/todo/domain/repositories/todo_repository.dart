import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos(String username);
  Future<void> saveTodos(String username, List<Todo> todos);
}
