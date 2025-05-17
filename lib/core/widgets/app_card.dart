import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';
import 'package:todo_app/core/utilities/app_radius.dart';
import 'package:todo_app/core/utilities/extensions/todo_status.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/status_badges.dart';

class AppCard extends StatelessWidget {
  final String title;
  final DateTime dueDate;
  final TodoStatus status;
  final VoidCallback onDonePressed;
  final VoidCallback onDeletePressed;

  const AppCard({
    super.key,
    required this.title,
    required this.dueDate,
    required this.status,
    required this.onDonePressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy hh:mm a').format(dueDate);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 140, maxHeight: 175),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.lg),
        decoration: BoxDecoration(
          color: AppColor.primary40,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StatusBadge(status: status),
                const Spacer(),
                GestureDetector(
                  onTap: onDeletePressed,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primary20,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.delete_outline,
                        color: AppColor.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppPadding.sm),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppPadding.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Due date:\n$formattedDate',
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (status != TodoStatus.done)
                  AppButton(
                    label: 'DONE',
                    onPressed: onDonePressed,
                    color: AppColor.secondary,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
