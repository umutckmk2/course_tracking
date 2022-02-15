import 'package:course_tracking/pages/course/course_view_model.dart';
import 'package:course_tracking/utilities/app_router.gr.dart';
import 'package:course_tracking/utilities/show_error.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AddCourseWidget extends StatelessWidget {
  final CourseViewModel courseViewModel;
  const AddCourseWidget({Key? key, required this.courseViewModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRouter>();
    DateTime _date = DateTime.now();
    final courseModel = courseViewModel.courseModel;
    final _textCntrl = TextEditingController();
    final _initialValue = ValueNotifier<DateTime>(_date);
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
          "Yeni Ders Ekle",
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
                controller: TextEditingController(text: ""),
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
                setCourseStartingTime(courseModel, context).whenComplete(() {
                  courseViewModel.startingTimeAsString =
                      DateFormat("hh:mm").format(courseModel.startingTime);
                  print(courseViewModel.startingTimeAsString);
                });
              },
              child: AbsorbPointer(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    initialValue: courseViewModel.startingTimeAsString,
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
            ValueListenableBuilder<DateTime>(
                valueListenable: _initialValue,
                builder: (context, value, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: PopupMenuButton<DateTime>(
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        leading: Text(
                          DateFormat("EEEE", "tr_TR").format(value),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 17),
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
                            _date = DateTime.now().add(
                              Duration(days: i),
                            );

                            return PopupMenuItem<DateTime>(
                              value: _date,
                              child: Text(
                                  DateFormat("EEEE", "tr_TR").format(_date)),
                            );
                          },
                        );
                      },
                      onSelected: (DateTime value) {
                        _initialValue.value = value;
                        courseModel.startingDate = value;
                        value = value;
                      },
                    ),
                  );
                }),
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
                  courseViewModel
                      .addCourse(courseModel)
                      .whenComplete(() => router.pop());
                },
                child: const Text(
                  "Ekle",
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
