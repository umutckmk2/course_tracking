import 'package:course_tracking/controller/main_page_cntrl.dart';
import 'package:course_tracking/models/course_model.dart';
import 'package:course_tracking/pages/add_course.dart';
import 'package:course_tracking/widgets/course_inherited.dart';
import 'package:course_tracking/widgets/course_ui.dart';
import 'package:flutter/material.dart';
import 'package:hive_listener/hive_listener.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mainPageCntrl = MainPageCntrl();
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
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ), 
                Text(
                  DateFormat('d MMMM y', 'tr_TR').format(DateTime.now()),
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          body: HiveListener(
            box: _mainPageCntrl.courseBox,
            builder: (box) {
              return ListView(
                children: [
                  for (CourseModel courseModel in _mainPageCntrl.getTodayCourses())
                    CourseUi(
                      courseModel: courseModel,
                    ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF03DAC5),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => CourseInheritedWidget(
                    courseModel: CourseModel(),
                    child: const AddCourse(),
                  ),
                ),
              );
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
