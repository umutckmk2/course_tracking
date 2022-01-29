import 'package:course_tracking/controller/notification_cntrl.dart';
import 'package:course_tracking/main.dart';
import 'package:course_tracking/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class CourseCntrl {
  final _courseBox = Hive.box<CourseModel>("courses");

  final _notificationCntrl = NotificationCntrl();

  final BuildContext _context;

  CourseCntrl(this._context);

  Future selectTime(CourseModel courseModel) async {
    DateTime currentDate = DateTime.now();
    TimeOfDay currentTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final TimeOfDay? picked = await showTimePicker(
      context: _context,
      initialTime: currentTime,
    );
    courseModel.startingTime =
        DateTime(currentDate.year, currentDate.month, currentDate.day, picked!.hour, picked.minute, 0,  DateTime.now().millisecond, DateTime.now().microsecond);
  }

  showError(String errorStr) {
    Fluttertoast.showToast(msg: errorStr);
  }

  Future addCourse(CourseModel courseModel) async {
    if (courseModel.courseTitle == null) {
      showError("Lütfen Ders Adı bölümünü doldurunuz.");
    } else if (courseModel.startingTime == null) {
      showError("Lütfen Başlama Saatini seçiniz.");
    } else if (courseModel.startingDate == null) {
      showError("Lütfen Ders Günü seçiniz.");
    } else {
      courseModel.id = courseModel.startingTime!.hour.toString() +
          courseModel.startingTime!.minute.toString() +
          courseModel.startingTime!.millisecond.toString() +
          courseModel.startingTime!.microsecond.toString();
      await _courseBox.put(courseModel.id, courseModel).whenComplete(() {
        _notificationCntrl.addNotitfication(courseModel);
        Fluttertoast.showToast(msg: "Ders Başarıyla Eklendi");
        Navigator.pop(_context);
      });
    }
  }

  deleteCourse(String id) {
    flutterLocalNotificationsPlugin.cancel(int.tryParse(id)!);
    _courseBox.delete(id);
  }
}
