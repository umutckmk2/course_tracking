import 'package:course_tracking/pages/course/course_model.dart';
import 'package:course_tracking/pages/course/course_view_model.dart';
import 'package:course_tracking/pages/home/home_page_view_model.dart';
import 'package:course_tracking/pages/course/add_course.dart';
import 'package:course_tracking/services/hive_course_cache_service.dart';
import 'package:course_tracking/widgets/course_inherited.dart';
import 'package:course_tracking/pages/course/course_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

final HiveCourseCacheService cacheService =
    HiveCourseCacheService(Hive.box<CourseModel>("courses"));

class _HomePageState extends State<HomePage> {
  final _homePageViewModel = HomePageViewModel(cacheService);
  @override
  void initState() {
    _homePageViewModel.setCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                Text(
                  DateFormat('EEEE', 'tr_TR').format(DateTime.now()),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('d MMMM y', 'tr_TR').format(DateTime.now()),
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          body: Observer(builder: (_) {
            return ListView(
              children: [
                for (CourseModel courseModel in _homePageViewModel.todayCourses)
                  CourseUi(
                    courseModel: courseModel,
                  ),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF03DAC5),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => CourseInheritedWidget(
                    courseModel: CourseModel(
                        courseTitle: '',
                        id: 0,
                        startingDate: DateTime.now(),
                        startingTime: DateTime.now()),
                    child: AddCourse(
                      courseViewModel:
                          CourseViewModel(cacheService, _homePageViewModel),
                    ),
                  ),
                ),
              );
              // _homePageViewModel.findTodayCourses();
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
