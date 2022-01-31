import 'package:course_tracking/services/course_cache_service.dart';
import 'package:course_tracking/services/notification_services.dart';

import '../course/course_model.dart';

import 'package:mobx/mobx.dart';

part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModel with _$HomePageViewModel;
late CourseCacheServices cacheServices;
final notificationService = CourseNotificationService();

abstract class _HomePageViewModel with Store {
  final CourseCacheServices cacheServices;
  _HomePageViewModel(this.cacheServices);
  @observable
   ObservableList<CourseModel> courses = <CourseModel>[].asObservable();

  @computed
  ObservableList<CourseModel> get todayCourses => ObservableList.of(courses
      .where((element) => element.startingDate.day == DateTime.now().day).toList());

  @action
  deleteCourse(CourseModel courseModel) {
    cacheServices.deleteCourse(courseModel.id);
    courses.removeWhere((element) => element.id == courseModel.id);
  }

  @action
  Future setCourses() async {
    cacheServices
        .getAllCourses()
        .then((value) => courses = value.asObservable());
  }
}
