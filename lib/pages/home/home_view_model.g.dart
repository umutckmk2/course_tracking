// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  Computed<ObservableList<CourseModel>>? _$todayCoursesComputed;

  @override
  ObservableList<CourseModel> get todayCourses => (_$todayCoursesComputed ??=
          Computed<ObservableList<CourseModel>>(() => super.todayCourses,
              name: '_HomeViewModel.todayCourses'))
      .value;

  final _$coursesAtom = Atom(name: '_HomeViewModel.courses');

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

  final _$setCoursesAsyncAction = AsyncAction('_HomeViewModel.setCourses');

  @override
  Future<dynamic> setCourses() {
    return _$setCoursesAsyncAction.run(() => super.setCourses());
  }

  final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel');

  @override
  dynamic deleteCourse(CourseModel courseModel) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.deleteCourse');
    try {
      return super.deleteCourse(courseModel);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
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
