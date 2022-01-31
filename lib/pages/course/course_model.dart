import 'package:hive/hive.dart';

part 'course_model.g.dart';

@HiveType(typeId: 0)
class CourseModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String courseTitle;
  @HiveField(2)
  DateTime startingTime;
  @HiveField(3)
  DateTime startingDate;

  CourseModel(
      {required this.id,
      required this.courseTitle,
      required this.startingTime,
      required this.startingDate});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data["id"] = id;
    data["course-title"] = courseTitle;
    data["starting-time"] = startingTime;
    data["starting-date"] = startingDate;

    return data;
  }
}
