import 'package:course_tracking/controller/course_cntrl.dart';
import 'package:course_tracking/models/course_model.dart';
import 'package:course_tracking/pages/edit_course.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseUi extends StatelessWidget {
  final CourseModel courseModel;
  const CourseUi({Key? key, required this.courseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _courseCntrl = CourseCntrl(context);
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseModel.courseTitle!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Başlangıç " + DateFormat("hh:mm").format(courseModel.startingTime!),
            ),
            const SizedBox(height: 10),
            const Text(
              "Body 2: Lorem ipsum dolor sit amet",
            ),
            Row(
              children: [
                const Spacer(), 
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
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _courseCntrl.deleteCourse(courseModel.id!);
                  },
                  child: const Text(
                    "Sil",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
