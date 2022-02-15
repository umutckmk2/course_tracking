import 'package:auto_route/auto_route.dart';
import 'package:course_tracking/pages/course/add_course_widget.dart';
import 'package:course_tracking/pages/course/edit_course.dart';

import '../pages/home/home_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: EditCourse),
    AutoRoute(page: AddCourseWidget),
  ],
)
class $AppRouter {}