// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:course_tracking/pages/course/add_course_widget.dart' as _i3;
import 'package:course_tracking/pages/course/course_model.dart' as _i6;
import 'package:course_tracking/pages/course/course_view_model.dart' as _i7;
import 'package:course_tracking/pages/course/edit_course.dart' as _i2;
import 'package:course_tracking/pages/home/home_view.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    EditCourse.name: (routeData) {
      final args = routeData.argsAs<EditCourseArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.EditCourse(key: args.key, courseModel: args.courseModel));
    },
    AddCourseWidget.name: (routeData) {
      final args = routeData.argsAs<AddCourseWidgetArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.AddCourseWidget(
              key: args.key, courseViewModel: args.courseViewModel));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeView.name, path: '/'),
        _i4.RouteConfig(EditCourse.name, path: '/edit-course'),
        _i4.RouteConfig(AddCourseWidget.name, path: '/add-course-widget')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i4.PageRouteInfo<void> {
  const HomeView() : super(HomeView.name, path: '/');

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.EditCourse]
class EditCourse extends _i4.PageRouteInfo<EditCourseArgs> {
  EditCourse({_i5.Key? key, required _i6.CourseModel courseModel})
      : super(EditCourse.name,
            path: '/edit-course',
            args: EditCourseArgs(key: key, courseModel: courseModel));

  static const String name = 'EditCourse';
}

class EditCourseArgs {
  const EditCourseArgs({this.key, required this.courseModel});

  final _i5.Key? key;

  final _i6.CourseModel courseModel;

  @override
  String toString() {
    return 'EditCourseArgs{key: $key, courseModel: $courseModel}';
  }
}

/// generated route for
/// [_i3.AddCourseWidget]
class AddCourseWidget extends _i4.PageRouteInfo<AddCourseWidgetArgs> {
  AddCourseWidget({_i5.Key? key, required _i7.CourseViewModel courseViewModel})
      : super(AddCourseWidget.name,
            path: '/add-course-widget',
            args: AddCourseWidgetArgs(
                key: key, courseViewModel: courseViewModel));

  static const String name = 'AddCourseWidget';
}

class AddCourseWidgetArgs {
  const AddCourseWidgetArgs({this.key, required this.courseViewModel});

  final _i5.Key? key;

  final _i7.CourseViewModel courseViewModel;

  @override
  String toString() {
    return 'AddCourseWidgetArgs{key: $key, courseViewModel: $courseViewModel}';
  }
}
