import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/utilities/app_padding.dart';
import 'package:todo_app/core/utilities/app_radius.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final bool? isDense;

  const AppTextField({
    super.key,
    this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
    this.style,
    this.contentPadding,
    this.isDense,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty) ...[
          Text(
            title!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColor.white
            ),
          ),
          const SizedBox(height: AppPadding.sm),
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          textAlign: TextAlign.start,
          style: style,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.primary40,
            hintText: hintText,
            hintStyle:  const TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: AppColor.white), 
            errorText: errorText,
            isDense: isDense,
            contentPadding: contentPadding ?? const EdgeInsets.all(AppPadding.md),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.xs),
              borderSide: const BorderSide(color: AppColor.primary40),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.xs),
              borderSide: const BorderSide(color: AppColor.primary40),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.xs),
              borderSide: const BorderSide(color: AppColor.alertRed),
            ),
          ),
        ),
      ],
    );
  }
}
