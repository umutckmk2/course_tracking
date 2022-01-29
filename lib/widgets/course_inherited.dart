import 'package:course_tracking/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseInheritedWidget extends InheritedWidget {
  const CourseInheritedWidget({Key? key, required this.courseModel, required Widget child})
      : super(key: key, child: child);
  final CourseModel courseModel;
  static CourseInheritedWidget of(BuildContext context) {
    final CourseInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<CourseInheritedWidget>();
    assert(result != null, 'No courseInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
