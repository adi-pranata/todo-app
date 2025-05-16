import '../entities/todo.dart';

abstract class TodoRepository {
  List<Todo> getTodos(String username);
  Future<void> saveTodos(String username, List<Todo> todos);
}
