import 'package:course_tracking/models/course_model.dart';
import 'package:hive/hive.dart';

class MainPageCntrl {
  final courseBox = Hive.box<CourseModel>("courses");

  deleteCourse(CourseModel courseModel) {
    courseBox.delete(courseModel.id);
  }

  getTodayCourses() {
    List<CourseModel> courseList =
        courseBox.values.where((element) => element.startingDate!.day == DateTime.now().day).toList();
    courseList.sort((a, b) => a.startingTime!.compareTo(b.startingTime!));
    return courseList;
  }
}
