import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_list_page.dart';
import 'package:todo_app/features/user/presentation/pages/user_form_page.dart';
import 'package:todo_app/features/user/presentation/providers/user_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final username = ref.watch(usernameProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) =>
            username == null ? const UserFormPage() : const TodoListPage(),
      ),
      GoRoute(
        path: '/todos',
        builder: (_, __) => const TodoListPage(),
      ),
    ],
  );
});
