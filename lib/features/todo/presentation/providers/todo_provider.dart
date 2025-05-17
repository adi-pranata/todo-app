import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/utilities/extensions/shared_pref_provider.dart';
import 'package:todo_app/features/todo/domain/usecases/get_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/save_todo.dart';
import '../../../user/presentation/providers/user_provider.dart';
import '../../../todo/domain/entities/todo.dart';
import '../../../todo/data/datasources/todo_local_datasource.dart';
import '../../../todo/data/repositories/todo_repository_impl.dart';
import 'package:uuid/uuid.dart';

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final username = ref.watch(usernameProvider);

  final datasource = TodoLocalDatasourceImpl(prefs);
  final repository = TodoRepositoryImpl(datasource);

  return TodoNotifier(
    username: username!,
    getTodo: GetTodo(repository),
    saveTodo: SaveTodo(repository),
  );
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  final String username;
  final GetTodo getTodo;
  final SaveTodo saveTodo;
  Timer? _timer;

  TodoNotifier({
    required this.username,
    required this.getTodo,
    required this.saveTodo,
  }) : super([]) {
    load();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (_) => _refreshStatus());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _refreshStatus() async {
    final todos = await getTodo(username);
    state = [...todos];
  }

  Future<void> load() async {
    final todos = await getTodo(username);
    state = todos;
  }

  Future<void> add(String title, DateTime dueDate) async {
    final newTodo = Todo(
      id: const Uuid().v4(),
      title: title,
      isDone: false,
      createdAt: dueDate,
    );

    final updated = [...state, newTodo];
    state = updated;
    await saveTodo(username, updated);
  }

  Future<void> toggle(String id) async {
    final updated = state
        .map((e) => e.id == id ? e.copyWith(isDone: !e.isDone) : e)
        .toList();
    state = updated;
    await saveTodo(username, updated);
  }

  Future<void> delete(String id) async {
    final updated = state.where((e) => e.id != id).toList();
    state = updated;
    await saveTodo(username, updated);
  }
}
