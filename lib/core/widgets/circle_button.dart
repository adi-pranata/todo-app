import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double iconSize;
  final Color? iconColor;
  final Border? border;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconSize = 20,
    this.iconColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 75, maxWidth: 75),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: border,
          color: AppColor.alertGreen
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor
          ),
        ),
      ),
    );
  }
}
