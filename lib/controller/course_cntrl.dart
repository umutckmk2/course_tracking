import 'package:course_tracking/pages/course/course_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CourseCntrl {

  final BuildContext _context;

  CourseCntrl(this._context);

  Future<TimeOfDay?> selectTimeOfDay() async {
    TimeOfDay currentTime =
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final TimeOfDay? picked = await showTimePicker(
      context: _context,
      initialTime: currentTime,
    );
    return picked;
  }

  Future<void> setCourseStartingTime(CourseModel courseModel) async {
    final date = DateTime.now();
    final picked = await selectTimeOfDay();
    if (picked != null) {
      courseModel.startingTime = DateTime(
        date.year,
        date.month,
        date.day,
        picked.hour,
        picked.minute,
        0,
        DateTime.now().millisecond,
        DateTime.now().microsecond,
      );
    }
  }

  showError(String errorStr) {
    Fluttertoast.showToast(msg: errorStr);
  }
}
