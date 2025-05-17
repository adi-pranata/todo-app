import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDatasource {
  Future<List<Todo>> getTodos(String username);
  Future<void> saveTodos(String username, List<Todo> todos);
}

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final SharedPreferences prefs;

  TodoLocalDatasourceImpl(this.prefs);

  @override
  Future<List<Todo>> getTodos(String username) async {
    final jsonString = prefs.getString('todos_$username') ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveTodos(String username, List<Todo> todos) async {
    final encoded = json.encode(
      todos.map((e) => TodoModel.fromEntity(e).toJson()).toList(),
    );
    await prefs.setString('todos_$username', encoded);
  }
}
