import 'package:course_tracking/pages/course/course_view_model.dart';
import 'package:course_tracking/utilities/show_error.dart';
import 'package:course_tracking/widgets/course_inherited.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCourse extends StatefulWidget {
  final CourseViewModel courseViewModel;
  const AddCourse({Key? key, required this.courseViewModel}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  var _initialValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();
    final courseModel = CourseInheritedWidget.of(context).courseModel;
    final _textCntrl = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                selectTimeOfDay(context).whenComplete(() => _textCntrl.text =
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
              child: PopupMenuButton<DateTime>(
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  leading: Text(
                    DateFormat("EEEE", "tr_TR").format(_initialValue),
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
                      _date = DateTime.now().add(
                        Duration(days: i),
                      );

                      return PopupMenuItem<DateTime>(
                        value: _date,
                        child: Text(DateFormat("EEEE", "tr_TR").format(_date)),
                      );
                    },
                  );
                },
                onSelected: (DateTime value) {
                  _initialValue = value;
                  courseModel.startingDate = value;
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
                  widget.courseViewModel
                      .addCourse(courseModel)
                      .whenComplete(() => Navigator.pop(context));
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
