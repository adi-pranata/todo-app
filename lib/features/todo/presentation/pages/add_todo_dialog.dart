import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/app_text_field.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';
import 'package:todo_app/core/utilities/validators.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );
      if (time != null) {
        setState(() {
          _selectedDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd MMMM yyyy hh:mma').format(_selectedDate);

    return Dialog(
      backgroundColor: AppColor.primary40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.lg),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('New Todo',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: AppPadding.lg),
              AppTextField(
                title: 'Title',
                hintText: 'This is todo title',
                controller: _titleController,
                validator: FormValidators.required,
              ),
              const SizedBox(height: AppPadding.lg),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: AppTextField(
                    title: 'Due date',
                    hintText: formattedDate,
                    controller: TextEditingController(text: formattedDate),
                  ),
                ),
              ),
              const SizedBox(height: AppPadding.lg),
              AppButton(
                label: 'Save',
                color: AppColor.secondary,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'title': _titleController.text.trim(),
                      'dueDate': _selectedDate,
                    });
                  }
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
