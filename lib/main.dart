import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/core/widgets/app_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: AppButton(
            label: 'Next',
            onPressed: () {},
            icon: Icons.arrow_forward,
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
} 
