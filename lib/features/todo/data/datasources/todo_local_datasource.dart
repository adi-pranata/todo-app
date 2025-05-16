import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDatasource {
  List<TodoModel> getTodos(String username);
  Future<void> saveTodos(String username, List<TodoModel> todos);
}

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final SharedPreferences prefs;

  TodoLocalDatasourceImpl(this.prefs);

  @override
  List<TodoModel> getTodos(String username) {
    final data = prefs.getString('todos_$username');
    if (data == null) return [];

    final List decoded = json.decode(data);
    return decoded.map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveTodos(String username, List<TodoModel> todos) async {
    final encoded = json.encode(todos.map((e) => e.toJson()).toList());
    await prefs.setString('todos_$username', encoded);
  }
}
