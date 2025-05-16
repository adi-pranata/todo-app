import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: AppColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
            const SizedBox(width: AppPadding.xs),
          if (icon != null) ...[
            Icon(icon, size: 20, color: AppColor.white),
          ],
        ],
      ),
    );
  }
}