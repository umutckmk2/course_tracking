import 'package:course_tracking/pages/home/home_page_view_model.dart';
import 'package:course_tracking/services/hive_course_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'course_model.dart';
import 'edit_course.dart';

class CourseUi extends StatelessWidget {
  final CourseModel courseModel;
  const CourseUi({Key? key, required this.courseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hiveCourseCacheService =
        HiveCourseCacheService(Hive.box<CourseModel>("courses"));
    final _homePageViewModel = HomePageViewModel(hiveCourseCacheService);
    return Container(
      child: AlertDialog(
        elevation: 10,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => EditCourse(courseModel: courseModel),
                ),
              );
            },
            child: const Text(
              "Düzenle",
            ),
          ),
          TextButton( 
            onPressed: () {
              _homePageViewModel.deleteCourse(courseModel); 
            },
            child: const Text(
              "Sil",
            ),
          ),
        ],
        title: Text(
          courseModel.courseTitle,
        ),
        content: Column(
          children: [
            Text(
              "Başlangıç " +
                  DateFormat("hh:mm").format(courseModel.startingTime),
            ),
            const SizedBox(height: 10),
            const Text(
              "Body 2: Lorem ipsum dolor sit amet",
            ),
          ],
        ),
      ),
    );
  }
}
