import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_padding.dart';
import 'package:todo_app/core/utilities/app_radius.dart';
import 'package:todo_app/core/utilities/extensions/todo_status.dart';

class StatusBadge extends StatelessWidget {
   final TodoStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 50,
        maxWidth: 100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.md, vertical: AppPadding.xs),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Text(
        textAlign: TextAlign.center,
        status.label.toUpperCase(),
        style: TextStyle(fontSize: 10,
        color: status.textColor,
        fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
