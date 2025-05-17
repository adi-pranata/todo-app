import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/widgets/app_card.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';
import 'package:todo_app/core/utilities/extensions/todo_status.dart';
import 'package:todo_app/core/widgets/circle_button.dart';
import 'package:todo_app/features/todo/presentation/pages/add_todo_dialog.dart';
import '../../../user/presentation/providers/user_provider.dart';
import '../providers/todo_provider.dart';

class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({super.key});

  @override
  ConsumerState<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  Timer? _timer;

  void _openAddDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const AddTodoDialog(),
    );

    if (result != null) {
      final title = result['title'] as String;
      final dueDate = result['dueDate'] as DateTime;
      await ref.read(todoNotifierProvider.notifier).add(title, dueDate);
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoNotifierProvider);
    final username = ref.watch(usernameProvider);

    return Scaffold(
      backgroundColor: AppColor.primary20,
      appBar: AppBar(
        backgroundColor: AppColor.primary20,
        title: Text(
          'Hi, $username',
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.lg),
        child: Column(
          children: [
            Expanded(
              child: todos.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada todo',
                        style: TextStyle(color: AppColor.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppPadding.md),
                          child: AppCard(
                            title: todo.title,
                            dueDate: todo.createdAt,
                            status: todo.status,
                            onDonePressed: () => ref
                                .read(todoNotifierProvider.notifier)
                                .toggle(todo.id),
                            onDeletePressed: () => ref
                                .read(todoNotifierProvider.notifier)
                                .delete(todo.id),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleButton(
        icon: Icons.add,
        iconColor: AppColor.primary20,
        onTap: _openAddDialog,
      ),
    );
  }
}
