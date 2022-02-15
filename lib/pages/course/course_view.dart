import 'package:course_tracking/pages/home/home_view_model.dart';
import 'package:course_tracking/services/hive_course_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../utilities/app_router.gr.dart';
import 'course_model.dart';

class CourseView extends StatelessWidget {
  final CourseModel courseModel;
  const CourseView({Key? key, required this.courseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final router = GetIt.I<AppRouter>();
    final hiveCourseCacheService =
        HiveCourseCacheService(Hive.box<CourseModel>("courses"));
    final _homePageViewModel = HomeViewModel(hiveCourseCacheService);
    return Container(
      child: AlertDialog(
        elevation: 10,
        actions: [
          TextButton(
            onPressed: () {
              router.navigate(
                EditCourse(courseModel: courseModel),
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
