

 import 'package:course_tracking/pages/course/course_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<TimeOfDay> selectTimeOfDay(BuildContext context) async {
    TimeOfDay currentTime =
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    return picked ??currentTime;
  }

  Future<void> setCourseStartingTime(CourseModel courseModel, BuildContext context) async {
    final date = DateTime.now();
    final picked = await selectTimeOfDay(context);
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