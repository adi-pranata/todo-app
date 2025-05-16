import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/app_text_field.dart';
import 'package:todo_app/features/user/presentation/providers/user_provider.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';

class UserFormPage extends ConsumerStatefulWidget {
  const UserFormPage({super.key});

  @override
  ConsumerState<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends ConsumerState<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(usernameProvider.notifier)
          .setUsername(_controller.text.trim());
      if (context.mounted) context.go('/todos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary20,
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.xl),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                title: 'Nama',
                hintText: 'Contoh: Wahyu',
                controller: _controller,
                validator: (val) => val == null || val.trim().isEmpty
                    ? 'Nama wajib diisi'
                    : null,
              ),
              const SizedBox(height: AppPadding.md),
              AppButton(
                label: 'Lanjut',
                icon: Icons.arrow_forward,
                onPressed: _submit,
                color: AppColor.alertGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
