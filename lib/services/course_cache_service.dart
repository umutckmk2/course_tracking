

import 'package:course_tracking/pages/course/course_model.dart';

abstract class CourseCacheServices {
  void deleteCourse(int id);
  Future<CourseModel> updateCourse(CourseModel courseModel);
  Future<void> addCourse(CourseModel courseModel);
  Future<List<CourseModel>> getAllCourses();
  Future<List<CourseModel>> getCoursesOfTheDay(DateTime date);
}