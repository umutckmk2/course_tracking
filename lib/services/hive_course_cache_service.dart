import 'package:course_tracking/pages/course/course_model.dart';
import 'package:course_tracking/services/course_cache_service.dart';
import 'package:course_tracking/utilities/show_error.dart';
import 'package:hive/hive.dart';

class HiveCourseCacheService implements CourseCacheServices {
  final Box<CourseModel> box;
  HiveCourseCacheService(this.box);
  @override
  Future<void> addCourse(CourseModel courseModel) async {
    if (courseModel.courseTitle == "") {
      showError("Lütfen Ders Adı bölümünü doldurunuz.");
    } else if (courseModel.startingTime == DateTime.now()) {
      showError("Lütfen Başlama Saatini seçiniz.");
    } else if (courseModel.startingDate == DateTime.now()) {
      showError("Lütfen Ders Günü seçiniz.");
    } else {
      courseModel.id = int.tryParse(courseModel.startingTime.hour.toString() +
          courseModel.startingTime.minute.toString() +
          courseModel.startingTime.millisecond.toString() +
          courseModel.startingTime.microsecond.toString())!;
      await box.put(courseModel.id, courseModel);
    }
  }

  @override
  void deleteCourse(int id) {
    box.delete(id);
  }

  @override
  Future<List<CourseModel>> getAllCourses() async {
    return box.values.toList();
  }

  @override
  Future<List<CourseModel>> getCoursesOfTheDay(DateTime date) async {
    return box.values.where((element) => element.startingDate == date).toList();
  }

  @override
  Future<CourseModel> updateCourse(CourseModel courseModel) async {
    box.put(courseModel.id, courseModel);
    return box.get(courseModel.id)!;
  }
}
