import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/app_colors.dart';

import 'package:todo_app/core/widgets/app_text_field.dart';

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
        backgroundColor: AppColor.primary20,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical:305,  horizontal: 74),
          child: Center(
            child: AppTextField(
            title: 'Name',
            hintText: 'name',
            controller: TextEditingController(),
            ),
          ),
        ),
      ),
    );
  }
} 
