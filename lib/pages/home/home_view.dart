import 'package:course_tracking/pages/course/course_model.dart';
import 'package:course_tracking/pages/course/course_view_model.dart';
import 'package:course_tracking/pages/home/home_model.dart';
import 'package:course_tracking/pages/home/home_view_model.dart';
import 'package:course_tracking/services/hive_course_cache_service.dart';
import 'package:course_tracking/pages/course/course_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../utilities/app_router.gr.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

final HiveCourseCacheService cacheService =
    HiveCourseCacheService(Hive.box<CourseModel>("courses"));

class _HomeViewState extends State<HomeView> {
  final _homeViewModel = HomeViewModel(cacheService);
  final _homeModel = HomeModel();
  final router = GetIt.I<AppRouter>();
  @override
  void initState() {
    _homeViewModel.setCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textCntrl =
        TextEditingController(text: DateFormat("hh:mm").format(DateTime.now()));
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                Text(
                  _homeModel.currentDay,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  _homeModel.currentDate,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          body: Observer(builder: (_) {
            return ListView(
              children: [
                for (CourseModel courseModel in _homeViewModel.todayCourses)
                  CourseView(
                    courseModel: courseModel,
                  ),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF03DAC5),
            onPressed: () {
              print("Hello");
              router.push(
                AddCourseWidget(
                  courseViewModel:
                      CourseViewModel(cacheService, _homeViewModel),
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
