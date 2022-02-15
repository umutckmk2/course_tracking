import 'package:course_tracking/pages/course/course_model.dart';
import 'package:course_tracking/services/hive_course_cache_service.dart';
import 'package:course_tracking/utilities/show_error.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../utilities/app_router.gr.dart';

class EditCourse extends StatelessWidget {
  final CourseModel courseModel;
  const EditCourse({Key? key, required this.courseModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRouter>();
    final _cacheService =
        HiveCourseCacheService(Hive.box<CourseModel>("courses"));
    String _initialValue = DateFormat("EEEE", "tr_TR").format(DateTime.now());
    final _textCntrl = TextEditingController();
    _textCntrl.text = DateFormat("hh:mm").format(courseModel.startingTime);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Düzenle",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                controller:
                    TextEditingController(text: courseModel.courseTitle),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  labelText: "Dersin Adı",
                  labelStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String str) {
                  courseModel.courseTitle = str;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
               selectTimeOfDay(context).whenComplete(() =>
                    _textCntrl.text =
                        DateFormat("hh:mm").format(courseModel.startingTime));
              },
              child: AbsorbPointer(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: _textCntrl,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      labelText: "Başlama Saati",
                      labelStyle: TextStyle(fontSize: 20),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: PopupMenuButton<String>(
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  leading: Text(
                    _initialValue,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                itemBuilder: (BuildContext context) {
                  return List.generate(
                    7,
                    (i) {
                      final date = DateFormat("EEEE", "tr_TR").format(
                        DateTime.now().add(
                          Duration(days: i),
                        ),
                      );
                      return PopupMenuItem<String>(
                        value: date,
                        child: Text(date),
                      );
                    },
                  );
                },
                onSelected: (String value) {
                  _initialValue = value;
                  courseModel.startingDate = DateTime.now();
                },
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF03DAC5),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  
                 _cacheService.updateCourse(courseModel).whenComplete(() => router.pop());
                },
                child: const Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
