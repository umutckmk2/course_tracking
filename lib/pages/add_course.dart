import 'package:course_tracking/controller/course_cntrl.dart';
import 'package:course_tracking/widgets/course_inherited.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String _initialValue = DateFormat("EEEE", "tr_TR").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final courseModel = CourseInheritedWidget.of(context).courseModel;
    final _textCntrl = TextEditingController();
    final _courseCntrl = CourseCntrl(context);
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
                _courseCntrl
                    .selectTime(courseModel)
                    .whenComplete(() => _textCntrl.text = DateFormat("hh:mm").format(courseModel.startingTime!));
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
                  _courseCntrl.addCourse(courseModel);
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
