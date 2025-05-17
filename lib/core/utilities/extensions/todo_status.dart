import 'dart:ui';

import 'package:todo_app/core/utilities/app_colors.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';

enum TodoStatus { open, done, overdue }

extension TodoStatusExtension on Todo {
  TodoStatus get status {
    if (isDone) return TodoStatus.done;
    if (createdAt.isBefore(DateTime.now())) return TodoStatus.overdue;
    return TodoStatus.open;
  }
}

extension TodoStatusDisplayExtension on TodoStatus {
  String get label {
    switch (this) {
      case TodoStatus.open:
        return 'OPEN';
      case TodoStatus.done:
        return 'DONE';
      case TodoStatus.overdue:
        return 'OVERDUE';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TodoStatus.done:
        return AppColor.alertGreen;
      case TodoStatus.overdue:
        return AppColor.alertRed;
      case TodoStatus.open:
        return AppColor.alertGrey;
    }
  }

  Color get textColor {
    return this == TodoStatus.open ? AppColor.primary20 : AppColor.white;
  }

  static TodoStatus? tryParse(String value) {
    return TodoStatus.values.firstWhere(
      (e) => e.label.toLowerCase() == value.toLowerCase(),
      orElse: () => TodoStatus.open,
    );
  }
}
