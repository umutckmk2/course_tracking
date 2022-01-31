// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModel, Store {
  Computed<ObservableList<CourseModel>>? _$todayCoursesComputed;

  @override
  ObservableList<CourseModel> get todayCourses => (_$todayCoursesComputed ??=
          Computed<ObservableList<CourseModel>>(() => super.todayCourses,
              name: '_HomePageViewModel.todayCourses'))
      .value;

  final _$coursesAtom = Atom(name: '_HomePageViewModel.courses');

  @override
  ObservableList<CourseModel> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(ObservableList<CourseModel> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  final _$setCoursesAsyncAction = AsyncAction('_HomePageViewModel.setCourses');

  @override
  Future<dynamic> setCourses() {
    return _$setCoursesAsyncAction.run(() => super.setCourses());
  }

  final _$_HomePageViewModelActionController =
      ActionController(name: '_HomePageViewModel');

  @override
  dynamic deleteCourse(CourseModel courseModel) {
    final _$actionInfo = _$_HomePageViewModelActionController.startAction(
        name: '_HomePageViewModel.deleteCourse');
    try {
      return super.deleteCourse(courseModel);
    } finally {
      _$_HomePageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courses: ${courses},
todayCourses: ${todayCourses}
    ''';
  }
}
