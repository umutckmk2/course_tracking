import 'package:hive/hive.dart';


part 'course_model.g.dart';

@HiveType(typeId: 0)
class CourseModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? courseTitle;
  @HiveField(2)
  DateTime? startingTime;
  @HiveField(3)
  DateTime? startingDate;
}
