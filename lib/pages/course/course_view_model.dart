import 'package:course_tracking/pages/home/home_view_model.dart';
import 'package:course_tracking/services/course_cache_service.dart';
import 'package:intl/intl.dart';

import 'package:mobx/mobx.dart';

import 'course_model.dart';

part 'course_view_model.g.dart';

class CourseViewModel = _CourseViewModel with _$CourseViewModel;

abstract class _CourseViewModel with Store {
  final CourseCacheServices cacheServices;
  final HomeViewModel homePageViewModel;

  _CourseViewModel(this.cacheServices, this.homePageViewModel);

  @observable
  CourseModel courseModel = CourseModel(
      courseTitle: '',
      id: 0,
      startingDate: DateTime.now(),
      startingTime: DateTime.now());
  @action
  deleteCourse(CourseModel courseModel) {
    cacheServices.deleteCourse(courseModel.id);
    homePageViewModel.courses
        .removeWhere((element) => element.id == courseModel.id);
  }

  @observable
  String  startingTimeAsString  =  DateFormat("hh:mm").format(DateTime.now());

  @action
  Future addCourse(CourseModel courseModel) async {
    cacheServices.addCourse(courseModel);
    homePageViewModel.courses.add(courseModel);
  }

  @action
  Future updateCourse(CourseModel courseModel) async {
    cacheServices.updateCourse(courseModel).then((value) {
      homePageViewModel.courses
          .removeWhere((element) => element.id == value.id);
      homePageViewModel.courses.add(courseModel);
    });
  }
}
