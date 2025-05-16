import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  List<Todo> getTodos(String username) {
    return datasource.getTodos(username);
  }

  @override
  Future<void> saveTodos(String username, List<Todo> todos) {
    return datasource.saveTodos(username, todos.cast());
  }
}
